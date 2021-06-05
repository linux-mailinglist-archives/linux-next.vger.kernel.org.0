Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B97839C915
	for <lists+linux-next@lfdr.de>; Sat,  5 Jun 2021 16:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFEOlc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 5 Jun 2021 10:41:32 -0400
Received: from mail-dm6nam11on2049.outbound.protection.outlook.com ([40.107.223.49]:50656
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229930AbhFEOlc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 5 Jun 2021 10:41:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkH7uWKzNfWZORDUTFwsd2eadZl9wl+qOCmr1fxjHnqd1pQyLNtTolh+CZqv7DUumJ+WJQJOvVlU1Wzf+gK2i05Fxo8iYFlWGQOQNnIX9GukvRyO21ms3VXnADY8CM/YhDpiWyjvUXOKynWgRSrInv50ezKvy9iDUurzYeYYPBuW/QXso2H0vw4n9YUiWiBk99TMYx7yHevxrRkhIkdiQ5PkK59xw+vlwO4IVDVc/G70GQ2TfNNPbyh88flAS/I+5Z+PoQ+6dLYmpEG3H1fKzPyuFKe0hT79W66hdhrp8wryw+U3vCmavTXjVeXKUcp5Yt2MaOziG8LUgUaQbl+NVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wFIopQeRCJsKmf+zTQt9n+Zq3xhOgiNEbptBxQ1gPc=;
 b=EirPC1gmHan7bXr98Qc1Sqmxqsvvmoxozi1UbxGqvoM2TdwlEdBSa5/jPolmzFqoak5C1xdClRRmYR25T8ZPZfI/hkPFNPJp7JpiqC3mTBT7vViJWcsj4EDpR4a6BegYlruS1/U+HfbOyZfVyJLhh+fNjOtXOWCn3XSWl6AiYzgHwyXWs0kxT6VzPzzn/Ph6utflThk4DawTlc2zZBfaBkJoV3XKJQH5EgK/n3Y7Yal+5GWPxMxMy686f45TMaj3YVk7FynfNZJ7MvkjpMphfyrYf512a/ahTxvDfetQ3U1olpP8TgfAvN1M0/JDRLW0IT7Y23qGMs22bkldM4B2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wFIopQeRCJsKmf+zTQt9n+Zq3xhOgiNEbptBxQ1gPc=;
 b=15UJnxpkq0T6//Tr7Aicvu1aUex6hEaFQBClxIbsf/ApRG4/5+4zjNcZ0Y6mMJWgYsLsCV2Wpho1/0iZeoZu/BVs6j6DdUPvKdQbCUEa6UIpJwPoRxbrLzcJ0RXTiYtAI2Ljy0yfTksV8Queo/gBW3jjyto7BOTus87z45x2NfU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0234.namprd12.prod.outlook.com (2603:10b6:4:56::22)
 by DM6PR12MB4779.namprd12.prod.outlook.com (2603:10b6:5:172::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Sat, 5 Jun
 2021 14:39:42 +0000
Received: from DM5PR1201MB0234.namprd12.prod.outlook.com
 ([fe80::a996:2224:603:1510]) by DM5PR1201MB0234.namprd12.prod.outlook.com
 ([fe80::a996:2224:603:1510%10]) with mapi id 15.20.4195.024; Sat, 5 Jun 2021
 14:39:41 +0000
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210605122627.0650db4b@canb.auug.org.au>
From:   Eric Huang <jinhuieric.huang@amd.com>
Message-ID: <ab066773-b3e2-ef83-e450-abe024eb5116@amd.com>
Date:   Sat, 5 Jun 2021 10:39:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210605122627.0650db4b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2607:9880:2048:122:2095:9ab6:3c38:b529]
X-ClientProxiedBy: YT2PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::28) To DM5PR1201MB0234.namprd12.prod.outlook.com
 (2603:10b6:4:56::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:9880:2048:122:2095:9ab6:3c38:b529] (2607:9880:2048:122:2095:9ab6:3c38:b529) by YT2PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.28 via Frontend Transport; Sat, 5 Jun 2021 14:39:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c7a3762-bd8a-4721-d4bb-08d9282fc104
X-MS-TrafficTypeDiagnostic: DM6PR12MB4779:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4779058E364B10465875CBB2823A9@DM6PR12MB4779.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wFzMyFiU9xY6hvgbh6X7cTbc6e8juVNgOQYNWack+nWjlUNNCnl930C2GixKbu/m2gVdLOVyd1MFRTK+czy1V7fpV/vgiVX1A2bOtkDsXzhjbUW+CvPlIJAMdCOImU+EzVyBQLacG9s0teICKXhM2nYXzwO3ZYK3w5GzCGzsTsouB7oisBbjbhL7fD9baiNA5m4zlC8kok2snSSL/1Xhn4zvdy6yDeLMFP7xZEpssqNGFN77fwXQD/K8kZn/Kj+giHTYTYxBzjfUtqCrdAKUB6lQcyNrvOAqJ+DVcbCpHQdzE/wCxCZPblq3F6P+qRtG4m6zGtcpGILygJUzPdQBJijEBayPO/TMkJR5HQLRo11K6BzrLuV5wHA1fjE/hDI58vICgE92ZdCQDEEYRow98O76z3o0PTNcfWRfezC8kbUeER/a+/PJg+PeiGLYjlQKPDNEbZ+7Q3uF3mnsKHndMIFR6GmUnW1g9vf53orbzEyeBcob4saKNlpHt8gE8ovEQRZ5hw0Z0zVdhOqyDXC4SOmXkShvHyXAvmgEA78DddD56VvorNTH9TGw3EMX835h4HVBh3zT6hDFFUPWZBaiHQ5W8KaUr1NZfZ/TluUFCowdMYjg0tzfuNuehd90p1ofX3nB8VOxt5hpCBYAyXZKQ+fjeNrtQz6+be1DRVcNKrGZF5L78VYKLxtGz7EkSY5k
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1201MB0234.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(66946007)(5660300002)(6486002)(66476007)(316002)(66556008)(31696002)(110136005)(54906003)(36756003)(38100700002)(31686004)(16526019)(53546011)(6666004)(83380400001)(186003)(4326008)(86362001)(8676002)(2616005)(478600001)(8936002)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?lUcNRKAZGhJYjwHcOy6VyojsIZZFDDYlWFAwMTmB40GRXabV0HHwbtdM?=
 =?Windows-1252?Q?a3ACWpcWz0b60cR58iPH2jAHOJtNpkcSXfcXLNlgXf4k9BI8faXw/zqU?=
 =?Windows-1252?Q?oCVzP8eJzpi/5Vb5Ga8ae6r8idQ5NIdjezA9j3bT4PLd5Jt9rPn3mG01?=
 =?Windows-1252?Q?RSBsVb0c4agmVB/igJtDOd9Rba9eG7NTlF3fKOfGP9zfk49FlZe9yPZU?=
 =?Windows-1252?Q?cdH9sVL4BWK1DaH7pZXHUTLYGxNXAAiPRJ3hCEj/pWGueUpcfzwcoVTM?=
 =?Windows-1252?Q?8dSYU8xEAQ6tx394c3Y+TXt68r/jp3slr9PZkH+wdOXPzekHeF+PaUXL?=
 =?Windows-1252?Q?1IM2hmE/sjMa3u9F9AoFMjkujxssivOPCqnqSZOke11y7GFoZKCr/4uy?=
 =?Windows-1252?Q?etl4ZLzngJXD6G3pxY25UAyOnqTwLh0ZTCL9aGZ3oSicW1XU0i+GKSJd?=
 =?Windows-1252?Q?uv8HvIgh57z83aXLgF6Hb77isEozWsUTw8uuTKijAJql+oJ2teftKAhv?=
 =?Windows-1252?Q?rb9O4N/wTYqHv96uk3gqoOMGmCQoLuGRZPdeHe/zQB/9aP8mrw81ULX3?=
 =?Windows-1252?Q?hnG4CRGuweUrriIJXsVRwHYm8cOrnj70tGUUmSmafxNIA6UYoNdSvBIq?=
 =?Windows-1252?Q?z+T4PUrjxmstVBkwSgOAWekfNMHt4rzWB7jsraDELJEuT5V5lyQDu6rD?=
 =?Windows-1252?Q?/hvWSadlh3dg7VehPuKvjJ5Wvy9jmz3sRvIQDwd20p5zCX7DDvxE2IWT?=
 =?Windows-1252?Q?y+1oHtjGIuUO13npmvBCZn0OUadJRIoon7n8ARrtycJ1JZGyJLmRJevc?=
 =?Windows-1252?Q?KTjiZqzYD4F5C9R9dDSv2AQ5bQIIiwGb13zOnM8XVPY6uxnsa7I5XBEt?=
 =?Windows-1252?Q?Jr+rfhkd3LXeVXcNGvUybqsxdDnhqWGAFadc2JktNzOVzySptozCpD7E?=
 =?Windows-1252?Q?/7goabHjnQI+NVoyb/LQUhaWx0NliwfO7gblZBQJtmFekrOwBOT8HDr1?=
 =?Windows-1252?Q?GUfFf2nlH1a2yX9EwinRadzzmdYtkahefR8iUy0fgPjG108LR0U3+D0L?=
 =?Windows-1252?Q?s58fMA5/o1zR/zIDmENhjR7K5+pHmsZuxsHDsoEjVLRKMVUDlqLqeNLe?=
 =?Windows-1252?Q?jW+CfnQ19lpmI9e0OG0cXfAFZUFYK0BP9lrDtO7xGgpA9iEKstDcLQX8?=
 =?Windows-1252?Q?uPCmOVVyM7CnqszyuntzCqI05mdBBZbvu73op1xpSs+WL/Yklc3xxpop?=
 =?Windows-1252?Q?/ciSPa1kh/Cc06lwmblzE+kisqF61lC3ULu22Gq1iXxjyTdiJrL56QvL?=
 =?Windows-1252?Q?esvB9GwP5sqE9U/dO+padbjKIFU1OnvBjtOR0+dMXt1b1drFG+xxp7SB?=
 =?Windows-1252?Q?Fb4eYdyRWRZe5YYhzpweoQ6NREVYF5dRh1j+JndxaQwseN5M+hHqtV+s?=
 =?Windows-1252?Q?jaXtDic0BSszm505n8yPeKXe1lq2FoMITwTzA52yqJX9aLryrltcZVpj?=
 =?Windows-1252?Q?hiDjkbAm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7a3762-bd8a-4721-d4bb-08d9282fc104
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0234.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 14:39:41.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkmOIuEDwy/l/x+2e4dD2cv4Fpu1Jw8q2zNXBkcmswmfTTo9Q/MctjGGkRiMOFqd66gfM6YfWrXD2QDtCwgcbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4779
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks. I will fix it.

Regards,
Eric

On 2021-06-04 10:26 p.m., Stephen Rothwell wrote:
> Hi all,
>
> After merging the amdgpu tree, yesterday's linux-next build (htmldocs)
> produced this warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1838: warning: Function parameter or member 'table_freed' not described in 'amdgpu_vm_bo_update'
>
> Introduced by commit
>
>    891069653f51 ("drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update")
>

