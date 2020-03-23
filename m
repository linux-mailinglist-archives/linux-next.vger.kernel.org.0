Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 873F018F0A2
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 09:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727503AbgCWIIq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 04:08:46 -0400
Received: from mail-dm6nam12on2073.outbound.protection.outlook.com ([40.107.243.73]:6051
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727486AbgCWIIp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Mar 2020 04:08:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOO1G7gWpf7d4k3u4hnT4ybHuMtEpJehQIByKseqoCceD9i0O6RrXXY135LAN2/AqKaDMWUIhqQRQlLGkzxzQtXzRp/yDU1vCRDsfiCqQXmK+VAh3yeBvAF5mqG1tVaZKSkl8doEVHRuPb/jfgNFRuVZ4TF9u3AFmJ4CWIUjavx3VNqrudzGUDz7P3k84yyPCOznm4FceXSrOjdcAENqfe5IluQ3NmzOhrMjbv2dRGwYr5pKw+R4rgybrJ1nY+0SwBwbDmHlEjv8yFgdrXa0wjqwLi/cdD3MINfIhedYfrjqH5jG0b07+OEDM5UPl+Japa/QmxsIL5s1vXf5c0z4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Enscesey7yzLYrtE4L+/Txn1r+dHg3TjlpnJWzhzZ3U=;
 b=F7L4MsZwKHEp+UzouhkbLBsI2hMAcHsedHxytf5URPFUMzZsShxoAj/nRrQEGRHU21+nfdMGfMEPOvG45oe3B2BhPwIyZbWi705KSUMwOaNilQvVoX0Nx0Tjlt9ejP7SmRu9YWB1+Q/KDZyRnoDtWIQ7tO8zP7q+qpDidla3GY7aU6CIdEjX7Uk5fD4oBaDSYNso2QV6ZogE8UwSOIGadKNoN6tq7rEO1PuEYvPvwjG5c+FckrFj7t19EXfg39a8xEinH8KPXvytFor6wwpgiwCn7QsuTna1+wSvdkYj3XGQBlA7+D3fPoDWC/tVR+RvVV99SDokwsmGP/b/iRhyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Enscesey7yzLYrtE4L+/Txn1r+dHg3TjlpnJWzhzZ3U=;
 b=qrJmi+s3l7YsI6KFUhL3LwvzHdB5kEEduExNz7b2+OHqb/04G1Eatwx///fW00MxW94ai9EepKAkFVrvMJCFGgTmbImJuRKzWxGnKQZdvrXqV44jq3l6R8dw+I//lz1uzDwsi3VooQoh4CizPRKOjzNyjxQLGPkVbpBkFncxAkM=
Received: from SN4PR0801CA0003.namprd08.prod.outlook.com
 (2603:10b6:803:29::13) by SN6PR02MB4096.namprd02.prod.outlook.com
 (2603:10b6:805:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 08:08:39 +0000
Received: from SN1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::fc) by SN4PR0801CA0003.outlook.office365.com
 (2603:10b6:803:29::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend
 Transport; Mon, 23 Mar 2020 08:08:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT036.mail.protection.outlook.com (10.152.72.149) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2814.13
 via Frontend Transport; Mon, 23 Mar 2020 08:08:38 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jGI8U-0005ni-Ca; Mon, 23 Mar 2020 01:08:38 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jGI8P-0000OV-9E; Mon, 23 Mar 2020 01:08:33 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02N88QS6021123;
        Mon, 23 Mar 2020 01:08:26 -0700
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jGI8I-0000NA-5d; Mon, 23 Mar 2020 01:08:26 -0700
Subject: Re: linux-next: build failure after merge of the irqchip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
References: <20200323175946.7ad497ea@canb.auug.org.au>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com>
Date:   Mon, 23 Mar 2020 09:08:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323175946.7ad497ea@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(199004)(46966005)(47076004)(44832011)(426003)(2616005)(186003)(356004)(31686004)(2906002)(336012)(478600001)(26005)(316002)(107886003)(110136005)(54906003)(5660300002)(31696002)(36756003)(70206006)(81166006)(8936002)(4326008)(9786002)(70586007)(81156014)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB4096;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5046c16-53a5-4a82-e686-08d7cf0164c3
X-MS-TrafficTypeDiagnostic: SN6PR02MB4096:
X-Microsoft-Antispam-PRVS: <SN6PR02MB409628BD8FF920262A743DB0C6F00@SN6PR02MB4096.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0351D213B3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wpPlRvzJSfDkg9r5lWNkSNJpB98RiCPPEStwLalSqqe8/g+etDERwMXBgDnH8ztvyN6BGYc4ZfQcn6a6AaA0+p3WpNbC8gcm15o5zMUbab3J71Hj27v15uq9u0ExaluPjxYCdtJETK2rJjdPrjfuQMY92/V4WgXj3KzKzwTD0MX3IVGzcEeQ/A6IGv9nuyX85NS4hJOf8uaBa2IvJjhmZZ2g8FXtk1Vdqf1LILkFIAn1/I/yV5EBX+anaZfK/20aHbuIGJAZsHOAmyFXpS0gZcTZ0oSFePD2NHIHQeWDfmkM14XIrS5UBlqCVYCERejGQCyPmCAJowukL3fl6mSrb4Ei1U9tQO94cd6a2fkoklrk925k7uMmXAB5275NfAqv0eZXLyiqIgfj006YoG5kg7wERkZULUrBi7MS3by0c3Zdm1r9RrvLgXFhk+V4WzOXCJQPabxrZ8ID61RdfWuODaxGRg5MMiycD1rVXTEXCNKxm0fy2rgz/I8RiS6Q/P0poPZmnrt/679ezN9cArS1g==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 08:08:38.7572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5046c16-53a5-4a82-e686-08d7cf0164c3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4096
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 23. 03. 20 7:59, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the irqchip tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> drivers/irqchip/irq-xilinx-intc.c: In function 'xil_intc_handle_irq':
> drivers/irqchip/irq-xilinx-intc.c:176:10: error: implicit declaration of function 'handle_domain_irq'; did you mean 'handle_bad_irq'? [-Werror=implicit-function-declaration]
>   176 |    ret = handle_domain_irq(irqc->root_domain, hwirq, regs);
>       |          ^~~~~~~~~~~~~~~~~
>       |          handle_bad_irq
> drivers/irqchip/irq-xilinx-intc.c: In function 'xilinx_intc_of_init':
> drivers/irqchip/irq-xilinx-intc.c:253:3: error: implicit declaration of function 'set_handle_irq'; did you mean 'generic_handle_irq'? [-Werror=implicit-function-declaration]
>   253 |   set_handle_irq(xil_intc_handle_irq);
>       |   ^~~~~~~~~~~~~~
>       |   generic_handle_irq
> 
> Caused by commit
> 
>   a0789993bf82 ("irqchip/xilinx: Enable generic irq multi handler")
> 
> I have reverted that commit (and commit
> 
>   9c2d4f525c00 ("irqchip/xilinx: Do not call irq_set_default_host()")
> 
> that conflicted with the other revert).
> 

thanks for reporting this.

Marc: I completely forget about this wiring for very ancient platform.
AFAIK Xilinx is not testing this platform for years and would likely the
best to remove support for it completely.
The second option is to get xintc_get_irq() back with note about powerpc
because it won't be that simple change all PPC platform to generic
domain irq handler.
Any other suggestion?

Thanks,
Michal
