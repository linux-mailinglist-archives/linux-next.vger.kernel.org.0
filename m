Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC113193926
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 08:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgCZHGv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 03:06:51 -0400
Received: from mail-dm6nam11on2058.outbound.protection.outlook.com ([40.107.223.58]:6173
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726210AbgCZHGu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 03:06:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9gAo/nBKsc4Oqv6jFJPv5DwDRcL0ETfbsVKjPWKqr1ceDvH4TgRIoo+lBD3mr43SDGpgnBLlgLJtcw/XPi74v8yMEAxx0JTj1eqN1LPy5bIxDoyAFrgKURaWRVXSrRKpaY1X1DobcHoAQhn9hodyYgPtnwbVST65ohcLlHFcjCYkWO/CdcsrRI6rSbg3hXvMpeuTJ16+xtj4WtBcrHenLOTWpiu8OYGKFzi+yX8B2Iu2Y36kxnQd66jZmDtp2zMDS+ixwlvpOOvmOWOb86J89GykAkbMcYoX5HDzf2BeQWJZ7Bd9LvFDmsY3fcIMfKQ2HyH2TvsMYZtiEIa1Y33kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uRXgbQfH6Tw8+20TlfCgdr2GO5mf3bTD/In5ZNh688=;
 b=CZPm/u8npXrFI2g3Eb+1gvDaPD62JMj9wrlZgew5f3ffAsXk7npGOHk4gGEbhqLHa6R4ZH0xUvolw+57bIcBE8G52+lU/5oa18jSJ1y473ndkcS1okzxotJ9v+g1yuvT73Lja12Hz8G25TKldhXV0xvyEPT+DxPK3qeHPxrdHgDq/XVxBuWwEqVr5GIWWh2pNQcdPhaeT5O1CRBOVx2v/vLZwINLBCNVrCUd3kk/qohepgXaUqd025R1Dej5qm6L/g8sEqXO9VHH8+wvOm/DUXn4dehCP/D+gfMFxGFYVhcqUdmKeUc8RCh0zRXrsQMhEdDcPed15+sr5HO62aDHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uRXgbQfH6Tw8+20TlfCgdr2GO5mf3bTD/In5ZNh688=;
 b=cZ+oq65SwgbE1vNP7X2WFPXNVegvLjQO9sCxjiKLxwyHWR63H7rrRSi0BSeCLydq57GsYgq4S83uJKyjivxEZQVfrqc4zOk2EMvGHZJoe5PHXXAYf6EeyW0S662Va/7s/vIZR//aKBeLnPK+lySwLlgmTn/u/5fGXLmXAM3Ggoc=
Received: from SN6PR08CA0010.namprd08.prod.outlook.com (2603:10b6:805:66::23)
 by DM5PR02MB2235.namprd02.prod.outlook.com (2603:10b6:3:4f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Thu, 26 Mar 2020 07:06:44 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::dd) by SN6PR08CA0010.outlook.office365.com
 (2603:10b6:805:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18 via Frontend
 Transport; Thu, 26 Mar 2020 07:06:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2856.17
 via Frontend Transport; Thu, 26 Mar 2020 07:06:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jHMbC-0008C0-U3; Thu, 26 Mar 2020 00:06:42 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jHMb7-00066x-Px; Thu, 26 Mar 2020 00:06:37 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 02Q76RvA019013;
        Thu, 26 Mar 2020 00:06:27 -0700
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jHMax-00062L-4B; Thu, 26 Mar 2020 00:06:27 -0700
Subject: Re: linux-next: build failure after merge of the irqchip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
References: <20200323175946.7ad497ea@canb.auug.org.au>
 <20200326173656.691628e8@canb.auug.org.au>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <1e0a9c45-e525-a3ac-b352-e236d8427e0b@xilinx.com>
Date:   Thu, 26 Mar 2020 08:06:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326173656.691628e8@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(82740400003)(8676002)(54906003)(110136005)(4326008)(2616005)(8936002)(9786002)(44832011)(81156014)(2906002)(31686004)(36756003)(107886003)(81166006)(26005)(70206006)(70586007)(31696002)(47076004)(336012)(356004)(316002)(5660300002)(426003)(478600001)(186003)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB2235;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88fa6663-a328-41fe-39cc-08d7d1543d69
X-MS-TrafficTypeDiagnostic: DM5PR02MB2235:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2235345791709C1BD321F130C6CF0@DM5PR02MB2235.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0354B4BED2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBxsBvX4UI+Jp5n0RGX/zPDbh0QkelckUIzpXxvhFjQA41FQM2i69/EVTpfqMCnt0aJFxImLnDoPc97WzwS39FPvW/h5w6lupQg1QFbs3f0WeMqBueZzCPK4GJJdrBDdGaUwGbb1AKiSEbRxJP1nH5/KTZyRiVGuu6Ztn0+a5zBGu0jbn8zprApO+TB1rSv1vOAk4tdqVsf9RM1zbIrph7LpbvrPiZ4Vfl00PyfPIAgew2p+Y7NkwdGju8EeQ/CXdB9JynQnjmDM5HFSkiv13HRb8Q4m5AYJBw0bqqURi1Pz0Lh+LRUgiYH0lfwfJ2KqwMlkSz+bNSTIK7CuQBDNokShAo6L2tLN2sl7LOst8bhaA7fWvgYbo2QjmWN2wcvqihTq/QiLLMrWvYJ839BJOrSdILT3BtcPGazTK07l5qI1kXnD1REb6pHi6wchJ8X/7mFSSpzrGJvcFhs2082BAVIBFiZ7tjCWtD+WrWCb21JcuTv758/cNHI6klmKFtRd1h7lYGJMyZ8nf9qFMLeneQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 07:06:43.2869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fa6663-a328-41fe-39cc-08d7d1543d69
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2235
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 26. 03. 20 7:36, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 23 Mar 2020 17:59:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the irqchip tree, today's linux-next build (powerpc
>> ppc44x_defconfig) failed like this:
>>
>> drivers/irqchip/irq-xilinx-intc.c: In function 'xil_intc_handle_irq':
>> drivers/irqchip/irq-xilinx-intc.c:176:10: error: implicit declaration of function 'handle_domain_irq'; did you mean 'handle_bad_irq'? [-Werror=implicit-function-declaration]
>>   176 |    ret = handle_domain_irq(irqc->root_domain, hwirq, regs);
>>       |          ^~~~~~~~~~~~~~~~~
>>       |          handle_bad_irq
>> drivers/irqchip/irq-xilinx-intc.c: In function 'xilinx_intc_of_init':
>> drivers/irqchip/irq-xilinx-intc.c:253:3: error: implicit declaration of function 'set_handle_irq'; did you mean 'generic_handle_irq'? [-Werror=implicit-function-declaration]
>>   253 |   set_handle_irq(xil_intc_handle_irq);
>>       |   ^~~~~~~~~~~~~~
>>       |   generic_handle_irq
>>
>> Caused by commit
>>
>>   a0789993bf82 ("irqchip/xilinx: Enable generic irq multi handler")
>>
>> I have reverted that commit (and commit
>>
>>   9c2d4f525c00 ("irqchip/xilinx: Do not call irq_set_default_host()")
>>
>> that conflicted with the other revert).
> 
> I am still getting these errors.
> 


Marc: Can you please respond my email I sent on Monday when Stephen
reported this issue?

Thanks,
Michal
