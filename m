Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B040635B8A1
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 04:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhDLC1I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 22:27:08 -0400
Received: from mail-co1nam11on2078.outbound.protection.outlook.com ([40.107.220.78]:51230
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235857AbhDLC1I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Apr 2021 22:27:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGmL0KZGEorYl4ovvbcQY4j0UKfNNldMudK5GZev+73uzu7/XUP8q8LazqDoCBPNVLHaUUbJ+nXXHhrSAPw4yckTzsyWjPk1RV/8pq+NRMwEMUwAlw25hkB52NSJep86VpffPlldx/5CHAvTqADZg3RVmHTY8i4aA1F8m4/WJBshEnc0JQAzlfJZ2qs/1V4lE8yo0sWrvhTycPguzC1J7abtcGkrXJ2PYt877hWfqU/Va38eYszel4U27pOoQiolj+mK4QMZyDrOTqf1KnaaFmfa52YDXqTFoZgkgaPYJ+8MHK+vRIk62xriT3i1ulYu3q+LvHOgLqZ77/rzq2RDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3vEZ09RTlsBOgxbaRfvvS7CkjRNqHOGBawz0325NpE=;
 b=eapXnr7oGpXYoDilREyICOvXw6fYZ+uswBJ9jNybPHz1wAzvRPP4ot5UO1+RPJtPKb1dG4gmUG+CggVIjCf1Z6zEQ3o76jhNzCcRXzmt59DQfbv9Zi/CFcIVhkxxMOrNUJDSyNUi6iU5aMsRkfn/kuuCROUzXGZHSFZaanG0j7rY8hhgL5zz5llGKrJ2DxbJR5hetuVID5yvpeeffZYF+fuUeRpm8aEKg0vmUhS8t7uwCmjZyiaCafCSK3ZMzvTfLC0HUpQSD4LEjUNiSamwLpf1txSEg+wVvMGEl60KXvlmRcn2kECcQn8RemO3rizj0KKGoGqQFrBTGXU11oThgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3vEZ09RTlsBOgxbaRfvvS7CkjRNqHOGBawz0325NpE=;
 b=oMQAV+uuJiIx06JDXrMtDqNKWuGKfb30fakHD6ZBIbHEZpV5mAyoumaU8Kxzu6qtYq1DcwSB5MatD3NuIKZcXpCqHu5ZSDVpAg/SOAERLaXJg7IQhqoo2OmwdjGpmw3B6Mx9La7z8WUzAj6hIxuSHgjur49k5DTEyERjJwbUMivbHM3WzLp8gG2HQdEgMYanBXjXhe5OM43Yzalf44HjgZ8Ai1HaKNjfIeZGRvLzUmzuR4DdOP0yqBC6UMyvOXZxbwqASrvTzWwjIHPyZ3CBWmB22yvQ9obW/72bYDTjFs16PEhlHjgN909xt8ykVYpblMokKJF2stLRC4QXC3JnjQ==
Received: from MWHPR15CA0043.namprd15.prod.outlook.com (2603:10b6:300:ad::29)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 02:26:49 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::ce) by MWHPR15CA0043.outlook.office365.com
 (2603:10b6:300:ad::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 02:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 02:26:49 +0000
Received: from [10.2.166.128] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 02:26:48 +0000
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210412083404.2d0dcf7c@canb.auug.org.au>
 <0aa24415-74c5-1adc-6e27-edf37285de4e@kernel.dk>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <02ac7276-e3c7-79b2-b3b0-361bbb884d16@nvidia.com>
Date:   Sun, 11 Apr 2021 19:26:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0aa24415-74c5-1adc-6e27-edf37285de4e@kernel.dk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1fcf4d7-435a-4d40-0cff-08d8fd5a6d11
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:
X-Microsoft-Antispam-PRVS: <SA0PR12MB45593BF4464025FB6DECFCC5C2709@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WsbZKXv2Q4wBRLUhOLh0JSzVW1A1AVtnXXzf10hDvyKim/NyjMewoh5dIbq4wijOtLG4n8yuwNGT/sGTuEdX64lvoGOgX+WS0Ju0LNrHV/3Yapp4FLz2Er9nXBFvcYiB/u3pXpN8jJKsnuU8eS9b0t3OJC2T1YoMu6QKYoCu/UBF3bIHJKi/2DOEDJc1o0Ha1YjpZvCn/K0mo13U6mfk1xyJ1HUJHNiu8ehFvSthTGa/eY6EhW9YpPV5z/kRbA/oGnRPgkr5RtJW2Gn8KUi81F2rIxA0xfGtxsgSRxXfUMmLi43Pz+7QtFBHD4d/nbkScQ10KFvtWcBv339+64KobgSVNygFZvHbkILJuYtN0M+TohPm7RPVo2X/04ih9V4xORzd+wgbN10wH9yqzCus94hB12aADgDKKC1Hr98PpnLtxwVNqhxciLX4tD9oyhIu3zEYZPW2mHUTdK+MyycD1XFnByLUkO8xWhh0egSkA2voR+0qB9z/4WKZUsaNO5Nk/oqonRHSz3E+7+bYfiw9CyDBKcHd36rVpVJ5QcyKZyBHN1jv/iKNfrulo25Lp3CCNKLVBxivuK9PFet3BdRwmyDlhtLxOpx2lIGlELLf4el0bsP7MlyLXwVkz3u4G3GbV6TtadK9F2gSLUwvE8pqCi5Tecs+hmq5qsESt6tv5Gww4CNqq/KPmwXhLydtU96X
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966006)(36840700001)(47076005)(4744005)(26005)(86362001)(336012)(36756003)(16526019)(186003)(356005)(7636003)(70206006)(82740400003)(70586007)(2616005)(5660300002)(426003)(8936002)(110136005)(316002)(36860700001)(16576012)(8676002)(53546011)(31696002)(36906005)(31686004)(478600001)(82310400003)(4326008)(2906002)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 02:26:49.0663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fcf4d7-435a-4d40-0cff-08d8fd5a6d11
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 4/11/21 7:14 PM, Jens Axboe wrote:
> On 4/11/21 4:34 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>>    6fa6517fe62e ("ata: ahci_tegra: call tegra_powergate_power_off only when PM domain is not present")
>>
>> is missing a Signed-off-by from its author.
> Sowjana, please reply that you're OK with me adding your Signed-off-by to that
> patch.
>
Sorry I should have checked that. Thanks Jens. Sure I am OK with it.

Thank you

Sowjanya

