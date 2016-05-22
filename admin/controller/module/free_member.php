<?php

class Controllermodulefreemember extends Controller
{
    private $error = array();
    private $_url = "";

    public function install()
    {
        $this->load->model('module/free_member');
        $this->model_module_free_member->install();
    }

    protected function init($isPage) {
        $this->data['token'] = $this->session->data['token'];
        $this->load->model('module/free_member');
        $this->language->load('module/free_member');

        if($isPage){
            $this->document->setTitle($this->language->get('heading_title'));
            $this->data['label_claim_code'] = $this->language->get('label_claim_code');
            $this->data['label_code_description'] = $this->language->get('label_code_description');
            $this->data['label_max_usage'] = $this->language->get('label_max_usage');
            $this->data['label_usage'] = $this->language->get('label_usage');
            $this->data['label_start_date'] = $this->language->get('label_start_date');
            $this->data['label_end_date'] = $this->language->get('label_end_date');
            $this->data['label_expiry'] = $this->language->get('label_expiry');
            $this->data['label_date_added'] = $this->language->get('label_date_added');
            $this->data['label_date_modified'] = $this->language->get('label_date_modified');
            $this->data['label_action'] = $this->language->get('label_action');
            $this->data['heading_title'] = $this->language->get('heading_title');
            $this->data['text_no_results'] = $this->language->get('text_no_results');
            $this->data['button_insert'] = $this->language->get('button_insert');
            $this->data['button_delete'] = $this->language->get('button_delete');
            $this->data['button_filter'] = $this->language->get('button_filter');
            $this->data['button_save'] = $this->language->get('button_save');
            $this->data['button_cancel'] = $this->language->get('button_cancel');

            /* BreadCrumbs*/
            $this->data['breadcrumbs'] = array();
            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => false
            );
            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_module'),
                'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
            );
            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('module/free_member', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
            );
            /* End Breadcrumb Block*/
        }
    }

    protected function appendFilter($filterName) {
        if ((isset($this->request->get[$filterName]))&&($this->request->get[$filterName]!=undefined)) {
            $filter = $this->request->get[$filterName];
            $this->_url .= '&'.$filterName.'=' . $filter;
            $this->data[$filterName] = $filter;
            return $filter;
        }

        return null;
    }

    protected function prepareSort($sortField){
        $this->data['sort_'.$sortField] = $this->url->link('module/free_member',
            'token=' . $this->session->data['token'] . '&sort=' . $sortField .
            '&order=' . ((($this->data['order'] == "DESC")||($this->data['sort']!=$sortField)) ? "ASC" : "DESC") .
            $this->_url, 'SSL');
    }

    protected function appendSortOrderPage(){
        if (isset($this->request->get['sort'])) {
            $this->_url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $this->_url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $this->_url .= '&page=' . $this->request->get['page'];
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        return $page;
    }

    protected function prepareURL(){
        $this->_url = '';
        $this->appendFilter("filter_claim_code");
        $this->appendFilter("filter_claim_description");
        $this->appendFilter("filter_max_usage");
        $this->appendFilter("filter_start_date");
        $this->appendFilter("filter_end_date");
        $this->appendFilter("filter_date_added");
        $this->appendSortOrderPage();
    }

    public function index()
    {
        $this->init(true);

        $this->_url = "";
        $filter_claim_code = $this->appendFilter("filter_claim_code");
        $filter_claim_description = $this->appendFilter("filter_claim_description");
        $filter_max_usage = $this->appendFilter("filter_max_usage");
        $filter_start_date = $this->appendFilter("filter_start_date");
        $filter_end_date = $this->appendFilter("filter_end_date");
        $filter_date_added = $this->appendFilter("filter_date_added");

        $this->data['sort'] = (isset($this->request->get['sort'])) ? $this->request->get['sort'] : "claim_code";
        $this->data['order'] = (isset($this->request->get['order'])) ? $this->request->get['order'] : "ASC";

        $this->prepareSort("claim_code");
        $this->prepareSort("description");
        $this->prepareSort("max_usage");
        $this->prepareSort("start_date");
        $this->prepareSort("end_date");
        $this->prepareSort("date_added");
        $this->prepareSort("usage");

        // To append after sort are prepared so as not to interfere with the links
        $page = $this->appendSortOrderPage();

        // Prepare to retrieve data from database
        $data = array(
            'filter_claim_code' => $filter_claim_code,
            'filter_claim_description' => $filter_claim_description,
            'filter_max_usage' => $filter_max_usage,
            'filter_start_date' => $filter_start_date,
            'filter_end_date' => $filter_end_date,
            'filter_date_added' => $filter_date_added,
            'sort' => $this->data['sort'],
            'order' => $this->data['order'],
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );
        $results = $this->model_module_free_member->getClaimCodes($data, false);
        $totalRecords = $this->model_module_free_member->getClaimCodes($data, true)[0]["count(*)"];

        // Prepare individual rows of data
        foreach ($results as $result) {
            $action = array();
            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('module/free_member/update', 'token=' . $this->session->data['token'] . '&claim_code_id=' . $result['claim_code_id'] . $this->_url, 'SSL')
            );

            $this->data['claimCodes'][] = array(
                'claim_code_id'     => $result['claim_code_id'],
                'claim_code'        => $result['claim_code'],
                'code_description'  => $result['description'],
                'max_usage'         => $result['max_usage'],
                'usage'             => $result['usage'],
                'start_date'        => $result['start_date'],
                'end_date'          => $result['end_date'],
                'date_added'        => $result['created'],
                'action'            => $action
            );
        }

        // Prepare buttons
        $this->data['insert'] = $this->url->link('module/free_member/insert', 'token=' . $this->session->data['token'] . $this->_url, 'SSL');
        $this->data['delete'] = $this->url->link('module/free_member/delete', 'token=' . $this->session->data['token'] . $this->_url, 'SSL');

        // Prepare Pagination
        $pagination = new Pagination();
        $pagination->total = $totalRecords;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('module/free_member', 'token=' . $this->session->data['token'] . $this->_url . '&page={page}', 'SSL');
        $this->data['pagination'] = $pagination->render();

        // Render Output
        $this->template = 'module/free_member.tpl';
        $this->children = array('common/header','common/footer');
        $this->response->setOutput($this->render());
    }

    protected function processField($field, $default) {
        $this->data[$field] = isset($this->request->post[$field]) ? $this->request->post[$field] : $default;
    }

    public function insert()
    {
        $this->init(true);

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if($this->validate(false)) {
                $this->model_module_free_member->addClaimCode($this->request->post);
                $this->session->data['success'] = $this->language->get('text_success');
                $this->prepareURL();
                $this->redirect($this->url->link('module/free_member', 'token=' . $this->session->data['token'] . $this->_url, 'SSL'));
            } else {
                $this->data['error'] = @$this->error;
            }
        }

        $this->processField('freemember_claim_code', '');
        $this->processField('freemember_code_description', '');
        $this->processField('freemember_max_usage', '0');
        $this->processField('freemember_expiry', '1 year');
        $this->processField('freemember_start_date', '');
        $this->processField('freemember_end_date', '');

        $this->getForm(false);
    }

    public function update()
    {
        $this->init(true);
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate(true)) {
            $this->model_module_free_member->updateClaimCode($this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->prepareURL();
            $this->redirect($this->url->link('module/free_member', 'token=' . $this->session->data['token'] . $this->_url, 'SSL'));
        } else {
            $this->data['error'] = @$this->error;
        }

        if (isset($this->request->get['claim_code_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $claim_code_info = $this->model_module_free_member->getClaimCode($this->request->get['claim_code_id']);
            $this->data['freemember_claim_code'] = $claim_code_info["claim_code"];
            $this->data['freemember_code_description'] = $claim_code_info["description"];
            $this->data['freemember_max_usage'] = $claim_code_info["max_usage"];
            $this->data['freemember_usage'] = $claim_code_info["usage"];
            $this->data['freemember_expiry'] = $claim_code_info["expiry"];
            $this->data['freemember_start_date'] = date('Y-m-d',strtotime($claim_code_info["start_date"]));
            $this->data['freemember_end_date'] = date('Y-m-d',strtotime($claim_code_info["end_date"]));
            $this->data['freemember_date_added'] = date('Y-m-d',strtotime($claim_code_info["created"]));
            $this->data['freemember_date_modified'] = date('Y-m-d',strtotime($claim_code_info["modified"]));
            $this->data['claim_code_id'] = $this->request->get['claim_code_id'];
        }

        $this->getForm(true);
    }

    protected function getForm($editMode)
    {
        $this->data['heading_title'] = ($editMode?"Edit":"Add")." Claim Code";
        $this->data['edit_mode'] = $editMode;

        $this->prepareURL();
        $this->data['action'] = $this->url->link('module/free_member/'.($editMode?"update":"insert"), 'token=' . $this->session->data['token'] . $this->_url, 'SSL');
        $this->data['cancel'] = $this->url->link('module/free_member', 'token=' . $this->session->data['token'] . $this->_url, 'SSL');

        $this->template = 'module/free_member_form.tpl';
        $this->children = array('common/header','common/footer');
        $this->response->setOutput($this->render());
    }

    protected function check_date($date)
    {
        return (preg_match("/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/", $date));
    }

    protected function validate($editMode)
    {
        if (!$this->user->hasPermission('modify', 'module/free_member')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if(!$editMode) {
            if (empty($this->request->post['freemember_claim_code'])) {
                $this->error['freemember_claim_code'] = $this->language->get('error_claim_code');
            }

            if ($this->model_module_free_member->checkClaimCode($this->request->post['freemember_claim_code'])) {
                $this->error['freemember_claim_code'] = $this->language->get('error_existing_claim_code');
            }
        }

        if (empty($this->request->post['freemember_code_description'])) {
            $this->error['freemember_code_description'] = $this->language->get('error_code_description');
        }

        if (empty($this->request->post['freemember_max_usage']) ||
            !is_numeric($this->request->post['freemember_max_usage'])
        ) {
            $this->error['freemember_max_usage'] = $this->language->get('error_max_usage');
        }

        if (empty($this->request->post['freemember_expiry'])
        ) {
            $this->error['freemember_expiry'] = $this->language->get('error_expiry');
        }

        if (empty($this->request->post['freemember_start_date']) ||
            !$this->check_date($this->request->post['freemember_start_date'])
        ) {
            $this->error['freemember_start_date'] = $this->language->get('error_start_date');
        }

        if (empty($this->request->post['freemember_end_date']) ||
            !$this->check_date($this->request->post['freemember_end_date'])
        ) {
            $this->error['freemember_end_date'] = $this->language->get('error_end_date');
        } else {
            if ($this->check_date($this->request->post['freemember_start_date'])) {
                if (strtotime($this->request->post['freemember_start_date']) > strtotime($this->request->post['freemember_end_date'])) {
                    $this->error['freemember_end_date'] = $this->language->get('error_start_end_date');
                }
            }
        }

        return (!$this->error);
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'module/free_member')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return (!$this->error);
    }

    public function delete() {
        $this->init(true);

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $claim_code_id) {
                $this->model_module_free_member->deleteClaimCode($claim_code_id);
            }

            $this->prepareURL();
            $this->session->data['success'] = $this->language->get('text_delete_success');

            $this->redirect($this->url->link('module/free_member', 'token=' . $this->session->data['token'] . $this->_url, 'SSL'));
        }
    }
}
