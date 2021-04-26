Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F55436B51F
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 16:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233996AbhDZOl2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 10:41:28 -0400
Received: from mail-mw2nam10on2050.outbound.protection.outlook.com ([40.107.94.50]:4449
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233987AbhDZOlZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 10:41:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FroNmMg77zrc66AjD4WXkx2Y7Zm1NzXpc5kdlE0h5VeX3P+YGHci4eEEJqRqpkBL6xYiUF6h5yi3brSeqT1tQ84LBCPHcecKUbVpA36VIL/KQj0cmaEfpoIiep37CH4X7mCWfmQK+qXpbXw53CWlXTpRtrpR9zhmpHjFT9EwFTef/+HDQ39a0MqL9U3yvZkdGjM+HlL0m7nvL5W/4BzbYqWVFQZBzGOKNYmvuTI+KLksnLdFBC9NMaBtoY8g9tOOHOGgNrhGFvUeFvCJb1aAxf5Q2Xrn3oMsg6w/3PRXZO/KtP94RE833v7YuCCu9MCVDpvW1Q6mRe2+gAWbheKHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F1G3MDFaQvxdMGBxmFciRoxraaAGozz5CgELJ0Sz3w=;
 b=KL0mcfdbxLHwD4LohuK3nDL5aaiEkYEvh1pwsk4ZT9mZ02ZWSSlcPmnSXp04lvfx45gvHFlsC2j73JDyTPJ3tgMSBsuhk+LlaVUpqH3F3zzx1iSlfhymoD2THInOtbyQVs6uUl7zsCpWREREcI9jsRdOZCxwp4a1dMXivgQEHMHpjRrvHU836aD4THrRrvr0orGXAiRV/Rx+Q6JidEodeENWMANTwQP+IoMrNDfqT+ZUrSbqk5bkKXw+/0qlaEVTcOqnHPQiMzoFCeZbH/zuahdV/LuvwLqgH90MHA+e2oSukWm9Smc442igE79nedErJK1EKjpzNhPSHKV9pNwFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F1G3MDFaQvxdMGBxmFciRoxraaAGozz5CgELJ0Sz3w=;
 b=37GIFQovaTlOoi/9yQWoI1D189e+GWYEPfPQqYQ5jQnTyk0MATbiKVLm2yIYu6dpuHRK5tPIEIBj2HTOP50uad+GCml3BK2T3ud98iruwqUcWU+QgP3mY6tWJI7DMdp4kktz71hqkJFeKJFApH2a3sk2fD5wqDDXlCo4wIJrLOE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR12MB1416.namprd12.prod.outlook.com (2603:10b6:903:44::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 14:40:41 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4065.026; Mon, 26 Apr 2021
 14:40:41 +0000
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Nirmoy Das <nirmoy.das@amd.com>, Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210426224030.38cc5597@canb.auug.org.au>
From:   Nirmoy <nirmodas@amd.com>
Message-ID: <98780a5b-14d9-6906-d993-ea206d653acb@amd.com>
Date:   Mon, 26 Apr 2021 16:40:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210426224030.38cc5597@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [217.86.97.47]
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (217.86.97.47) by FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.17 via Frontend Transport; Mon, 26 Apr 2021 14:40:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27bf824-dee6-41ce-0822-08d908c143ef
X-MS-TrafficTypeDiagnostic: CY4PR12MB1416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB1416CCEFDE3DCBB38B043B978B429@CY4PR12MB1416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:36;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqOjTMT7vGZs+9HttEO21y4xJvbnasA32nY3qXZOMwGSjgJg6dmFsmKL42/jmCboqXJlqt7NJxeelf0H16bw7PiPRFFgbxxtHEjKDFuaU0E9wG5zlbkVPP/jXHrOfljR1eJKJfoKPoh/lh+pw/zkuS6EMzGmJwSHQ8jJp57Jv0KnDDwtb25I0I3CTfEHgs3+fRicYmc35/13qddHJnR+rnG4CnGDdD6DPEgEDGMrR7pXfhc9kY0VdREfSnSbPMrk9tJJTIUKSwnx4Sj8DRdyjOuF7ch+ka8gbZlwG/QPQGhfnGk0B+0K9ODLnJYeJtPVz+HOjGBv1y2JBJvtq6kOuvsiTLyF5wZ+c/kp8H11VkVq5oIu/uafqsERddVRxRoZozH5asq1pkgPLprr5XtlCx6gBzP6b7uf/cOD00fe7Hs+nJUWGhLGqjwnBvR9g1/F8NSWredmONrIPavQBNtsgZJC6Hjhsfrk9r96MjizedfotIwbW8nZM0YvDjnNECW8I+VTjFr9QdIYFB0hpSW/aqjbeXPXdmBEHUQP0dUwxaN4VG5B/e/GlQ2SvewLvWrsWAL1r2Rxj/FOks9UtpU0XeRhHuB6JWmK669rCpTkitGGczD2HJDb68hOOMcjUYStPeTNQBN3B1lgS0PnhpYWQ5mFFBp7YcBn6QI7vgKFaU7kDRj+8CpdXppoj8xfZ+3LuCfW3jmJdByhSgnMVwRm1PoKQXyQ9gMwy2WJhhlySy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1463.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(83380400001)(110136005)(52116002)(26005)(53546011)(8936002)(16576012)(316002)(66946007)(16526019)(8676002)(2616005)(54906003)(4326008)(956004)(36756003)(38100700002)(38350700002)(31686004)(66476007)(66556008)(6486002)(31696002)(186003)(2906002)(5660300002)(6666004)(4744005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?/7Wmg8e1NqPXtLpkBxf+s51e0yZuHjYnpGPsqtBNdvYDBBkGhaCGNoNQ?=
 =?Windows-1252?Q?YabyYcoz/zAtakj8dcmK4bU6bx6jQT1Qbjm8FwYvly5sotB9Cofq02zb?=
 =?Windows-1252?Q?FsCX9WsLo9abxJXYJtKbIJHJKu/zUQSrXprbk+WUlFOikUzBH0XQFith?=
 =?Windows-1252?Q?I969zDJfCKHAqUz1OIINvoeaflt/fdA5n3ZeX6PZUFpGqz/CHamyzRas?=
 =?Windows-1252?Q?a/8ym/LiXVhB3X8THuNiT6Mu8GzpkeuLN4N3G0X+adGP29Xkli9kWOSY?=
 =?Windows-1252?Q?MoqpsftAdazS9c7Ge3ImhrsyCm53AswSRdvFtIDwlwuEHcskBddFCuuo?=
 =?Windows-1252?Q?ylcQwnY+IgE1zu4OWHZAPqZGBl1HhTpEH6nCu1x1/nunVS7XCaGjqgg7?=
 =?Windows-1252?Q?6cjBQ/KRS4qiOg9Ywx+fVtA0xhliFR0OmmWsVHj7vl+TwQ+O0FlLvWiD?=
 =?Windows-1252?Q?3ywz1PUUpIhAq+IIH9374xfqO0WEoLriJH9QV5bNe2XRW4V69rRSac99?=
 =?Windows-1252?Q?Rwzi50UW3IyVl9app9LPUjXIJOmdv50hm8a19KovC2DirOAKc9hMeAgV?=
 =?Windows-1252?Q?ehIO5w2EXtEabCfVYdPEFjayhoam2zGRzalCfJfsD2kTGQ7neihirGXq?=
 =?Windows-1252?Q?sov7pAT5MeA11AQB9kO0PFHqo5ZW0QCdJOjcR/jbV+kbMzfoIMDgsWVN?=
 =?Windows-1252?Q?2DsZLbgtvSpusdGCPRM5tuVE4cBH+gp/cvKJgKPBByuH1of6r8+pXW7n?=
 =?Windows-1252?Q?+GCA/TYG/ZlPkJBgo4p0Q/QWTnlTZ2jky7SKku3Jf/YuvDP15H/LYwDU?=
 =?Windows-1252?Q?mtUraWBmLOUHqj99HFcPbF8FKwULcjM1i1H8gS0vUWYoa1e4trRkaY9K?=
 =?Windows-1252?Q?Bn7DUF1m3taSotWtPMOGWRa50tdcoW8DuvKVAutlMbvs3a9J1MZA6HC8?=
 =?Windows-1252?Q?xdxA3GkP9Yl/ZIhjLilT+971/3k5SHvk55ZaEHL1ge6/Z/I3fkX6xHxT?=
 =?Windows-1252?Q?L3F5guYVP9CNQUSRWO9rMTQiCEC5AP2KS/ORbhV1hjSdTwL4O/A47o3N?=
 =?Windows-1252?Q?UBDNavSWXBeyEb3r0Oh00TWRso6ATrkVYMpyMZfT0PGGEE/MtyYCzMc3?=
 =?Windows-1252?Q?7euvzPGHZHUUQ11C2GTCNbe0I2TTXu+LVmvf78DU9g+5ooMC0qWbtlBw?=
 =?Windows-1252?Q?Us8sAFdShgIGbsKaevAgMPHmjjd95JMGsRDhH9eG2NT+BAHpfakaZa3V?=
 =?Windows-1252?Q?xor0WUrZKXUra38EbRzjhs3R9xR7txtDHyEkidEkrwRp7KbwQxKB0MYc?=
 =?Windows-1252?Q?QToBLSJuOHgyNFdo1qywhhSO0I8P71KG4pe1oDW8o2Pa/hQl67PcIwyf?=
 =?Windows-1252?Q?hQaaceTNSGWmAylifLWEIEk3KAdXLyyrKhHhPQJSNTgBOWaHBEZo/ONA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27bf824-dee6-41ce-0822-08d908c143ef
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 14:40:41.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXDT5E/LzffeKelZn2HQV0bPWYJirqZSGHF8oEy4abtNlFt9ur861dMdOrqI3lXV5qKmAgnUubWPgC0100yeeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1416
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Sorry about that and thanks Stephen, I will send a patch to fix the doc 
warning.


Regards,

Nirmoy

On 4/26/21 2:40 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Excess function parameter 'vm_context' description in 'amdgpu_vm_init'
>
> Introduced by commit
>
>    a35455d065c5 ("drm/amdgpu: cleanup amdgpu_vm_init()")
>
