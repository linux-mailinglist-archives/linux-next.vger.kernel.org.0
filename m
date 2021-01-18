Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821662F9FED
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 13:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404043AbhARMgw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 07:36:52 -0500
Received: from mail-mw2nam12on2081.outbound.protection.outlook.com ([40.107.244.81]:43376
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390851AbhARMgj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 07:36:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gj+cw3Uyp9lkRv+hYSzgsWtlnHvqSsdwxZwpqLu8AiigVKwmbVXI/PWUei94U2IwUFs5Ic94ae+jeBwjfx8CmXl2+vcpg6cjYUOdYQy42jDDRYkWXdR9NrclLtCFR0Mesqg/8pkb55I3TcuAcgTb/sQFf4dDXX/lRJEyQ6h8LO6OwVgGmBBBMUSOiACOXhBwFe1jtdt77KVwgvlzPyESbiFRD+aQ843Ciktg2Y7hkpos4Vb+fulsLhAZuOgjf+10cYgTZJ4RnAPiUEOHbS1gBTeEaEdIQq5vDYoW1TcbALQFJtsLIE8vek2c1Ez1nwOMJ3UzFYfUdbM7xTuF0uwoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fGjC0xDtgsVp6bzLqEeqaDtyIw7f1/wYHnL1m7IWcg=;
 b=BO0Qa3qRYUMj7V5omJMuseL669APDsVvn23gKUx1EbXscbOpcIV0W+MtGWwCDNlhMyK3JyxO7SAofWVcdHU75VVXFj6QuJd7WGjtOUBLhOTvsav5w9gjpqr0JtkJLHdZsXU3fl4Qp1Xy9dktFn/nDP+pKDIwPtDptBqsOAnbLp44NNKOJLixgGXLJh7u/pjvVLXok6xBwDGXAxuHBiu8sOlVQ3HXdrSkqEEbTMwhh7npvXyN54bIC4XQJ3zyvKJPkihdAn4K/o9arexodutxKJZZD6Fy7Oq8o/I5LNRaeAw6AuDlPdrs2MA3n9b6iNHK1RPaP4g3ITVdy3eweSKTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fGjC0xDtgsVp6bzLqEeqaDtyIw7f1/wYHnL1m7IWcg=;
 b=QlFXCyZTfSADcagiiE5ODRl4XAcoqSNWKGnoA5DcDVxHSZIhmdbaPuIF69xyuEUUUfgxsEhwWxkfb+1fMTqwfXDsed9pWOqVyJWcUzBsn/EVL5Eab0LVCWQ2G71j1xMnnSGSvFvthbx3Vb780aTWSmyi7VUu5pLBN6sJTujWUsI=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1744.namprd12.prod.outlook.com (2603:10b6:300:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 12:35:44 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:35:44 +0000
Date:   Mon, 18 Jan 2021 20:35:36 +0800
From:   Huang Rui <ray.huang@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210118123536.GA22628@hr-amd>
References: <20210118162919.51f2dd3a@canb.auug.org.au>
 <MWHPR12MB12481D121098DD37D4CB10F4ECA40@MWHPR12MB1248.namprd12.prod.outlook.com>
 <20210118175218.2fbc18f8@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118175218.2fbc18f8@canb.auug.org.au>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Mon, 18 Jan 2021 12:35:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e7a6476-974f-4a96-38f5-08d8bbad92e6
X-MS-TrafficTypeDiagnostic: MWHPR12MB1744:
X-Microsoft-Antispam-PRVS: <MWHPR12MB174446AB336A729F674D0B85ECA40@MWHPR12MB1744.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WcmnRnVxjJDLqy2tFpyzoDAcNgynAhppx8M+Fq9KrqcakruLson92HhaUNHzrww8cEfEUHJvTQ43iuEA7gOSd19/GuOCQ8PtUWfZ2/VBJ5tvoHiosgQq+DKL35ZIDSdJ+wCOk0ByPW1s8/JC2luGFrAUq0762FxBbHIbNxf6EsP9TqUpCaZ+t5hCqgQq2mNMv1x3WFYQbqj7Zd/y6Hh4H3C7qjDqOvxAdzjlZdOY2UkQ/eHfzsAxDCZCI85qwDrnHjqk/RoJoC8vswTyaG8hiO2IG4yPRQ5sSY5SNKNetuATFpk5ooL2pEJG0t287HktTL2gREADbC0q7StMvmgtHCHSxAC8l8X0awQqDw3vm1Efiz0CcMiXm1coD8u4uvarEiKbD9gxTm/gmIfsfHNNAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR12MB1248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(186003)(66946007)(8936002)(9686003)(5660300002)(1076003)(2906002)(86362001)(6666004)(33716001)(4326008)(66556008)(478600001)(316002)(4744005)(33656002)(16526019)(66476007)(956004)(55016002)(54906003)(6496006)(8676002)(52116002)(26005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hcjJCYXPTzSe38rMZMRth4zOFTY4rBJoF0ctIkcAzSRLzbbNnpFhA5C+KSiH?=
 =?us-ascii?Q?YnA56N1bl8lOdPK8Jrtn4Vn1+I7JQ0zzgTCGIZE6sJXUNn/3+12KxY94qLs/?=
 =?us-ascii?Q?//Eyn/TIW/XHRL2qsRS6YT7yT2j6yoTr3SlW27Ftkft3Be0JJFm0T3ICk8O1?=
 =?us-ascii?Q?wuN6kW+sZK3GO+rtT75GBw/30S8/Zn/mmsTXwSxtwWH7MpQhWu8by2vatqn0?=
 =?us-ascii?Q?7A1bmGJlN1TmCjmLP3p3mtMBIzNsOujjZHmYEhjEVn3fIGlF/oFILsEEGYMy?=
 =?us-ascii?Q?Cpi49ZGucGYT57FfXOqMqCLyVMn9pT8cY8qHor5GH0ouyZdFRNuwcHaiEee1?=
 =?us-ascii?Q?OPbbxy0AibEpVw0S0mXJG7+ZabgL9NGOPaBk+dKKVV8qF9EroUlQMa7cAB75?=
 =?us-ascii?Q?/8//9KvkUTHCNZxy7zTN+bii0U4r7ndmVf25kWGcYNsy3ZjddOo9vMruMDIe?=
 =?us-ascii?Q?ezXRc5AH6JEbGMIZK1D5fVRaY68GfJ18jwgJYDpCmS9K0nc1S2LnOEnBOhD8?=
 =?us-ascii?Q?hLwI/Vse3S8tiTEeu1SpskLIvHt/23DycUPjvSSzAWZCA3GUo8Y6JiwIk8kp?=
 =?us-ascii?Q?e7LObY+rDTqIBDYFDdnjrJ1v4tYhjYJ6w6vf7QexhT+qczPlsODS2EHlM+Hf?=
 =?us-ascii?Q?LhBVYd3ZnRDuWAFI+qmkXYaibGIds6+cv6TyVV8XkWHvs/D2nUIIndbeKZQf?=
 =?us-ascii?Q?v7YOO791Xa9R65b91W8jy9UvrgK0ZReLD85f4IramSECaVmaNSCPFaFtUQyy?=
 =?us-ascii?Q?9OD6vkXyIsp+anWBaL1QyrJgrOnGxTKkq1uKyFouqzjAWb70njTozyv6oGz2?=
 =?us-ascii?Q?/Vb0yxh43MX3iO1ayxhckI9NLPdIccOkcbCuO5g8SJhhYYw/fb35LWeuhcna?=
 =?us-ascii?Q?FZMNkoy3UM+ysHvoE3DdVjZBAHQpFWuM9LD83K3IFhzcl6bZfBp9B1K4iJWd?=
 =?us-ascii?Q?LdRhO/N3Q3690GjWIdidpKu1TKWpTQE3Un5DDO6ejVbCxyApYFPWSy2x8oQO?=
 =?us-ascii?Q?i4WE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7a6476-974f-4a96-38f5-08d8bbad92e6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:35:44.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C45nFIkfkSLwIYq7n/gJsRtB/ssklf06SxN1C4MYgOzrCiWn3g1H6+esNWjmMiCb8Tq16pZC6K8/X8aumUqVWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1744
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 18, 2021 at 02:52:18PM +0800, Stephen Rothwell wrote:
> Hi Ray,
> 
> On Mon, 18 Jan 2021 05:56:20 +0000 "Huang, Ray" <Ray.Huang@amd.com> wrote:
> >
> > [AMD Public Use]
> > 
> > Thanks Setphen. Please check attached V2 patch.
> > (If you can share the config file to me, I can do the test in my side)
> 
> It looks good, but I did not try to build it.  I have attached the
> config (it is just a powerpc allyesconfig).
> -- 
> Cheers,
> Stephen Rothwell

Thanks Stephen.

Ray
