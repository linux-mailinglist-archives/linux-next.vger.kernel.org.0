Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6D9319BF4
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 10:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBLJhU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 04:37:20 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8611 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhBLJhQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2021 04:37:16 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60264c220000>; Fri, 12 Feb 2021 01:36:34 -0800
Received: from reg-r-vrt-018-180.nvidia.com (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Feb 2021 09:36:31 +0000
References: <20210211222604.51bd537c@canb.auug.org.au>
 <YCWT6TZCGQOXlf6B@osiris>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Vlad Buslov <vladbu@nvidia.com>
To:     Heiko Carstens <hca@linux.ibm.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmytro Linkin <dlinkin@nvidia.com>,
        Roi Dayan <roid@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Feb 11
In-Reply-To: <YCWT6TZCGQOXlf6B@osiris>
Date:   Fri, 12 Feb 2021 11:36:29 +0200
Message-ID: <ygnh8s7tsk4i.fsf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1613122594; bh=RserMEccpievJi4knvPI7JSCL0bayUw+P38G/ozwRCw=;
        h=References:User-agent:From:To:CC:Subject:In-Reply-To:Date:
         Message-ID:MIME-Version:Content-Type:X-Originating-IP:
         X-ClientProxiedBy;
        b=K3ot1ngeO8zwBjXPrrPdbKUyijcy/bjwcy+awyTuIEXEas0fpWzpMw46d5/CLEDMb
         T4JRvpg4NOQU/37PN/ZHLOolQPOfyA/MJOWVIMr5fSeMHSPyLLslJhRo5ga3jv0iPa
         wOnoyHxwjLKASlr/FNIUPIbQuFiKuCjKGNV9TBDTXB/w/9oqplJ1ScJdtSJMR3PTsp
         jHuVy1mq9VGxl/pngp30heMIsBZ1ayRPqiHhlvkzeauDuE8bXXLz7Pr1dlrsgHUxSN
         NE/tstRel2mbXeFrakCT49wrk1mzVOTgFwXpZ5ixSVmSrhOCbALubsdgsAqX03flR7
         8owCRSVIxeZBw==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu 11 Feb 2021 at 22:30, Heiko Carstens <hca@linux.ibm.com> wrote:
> On Thu, Feb 11, 2021 at 10:26:04PM +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20210210:
>> 
>> The powerpc tree still had its build failure in the allyesconfig for
>> which I applied a supplied patch.
>> 
>> The v4l-dvb tree lost its build failure.
>> 
>> The drm-misc tree lost its build failure.
>> 
>> The modules tree lost its build failure.
>> 
>> The device-mapper tree gained a build failure so I used the version
>> from next-20210210.
>> 
>> The tip tree lost its boot failure.
>> 
>> The rcu tree gained conflicts against the block tree.
>> 
>> The driver-core tree lost its build failure.
>> 
>> The akpm-current tree gained conflicts against the fscache tree.
>> 
>> Non-merge commits (relative to Linus' tree): 9533
>>  9470 files changed, 385794 insertions(+), 266880 deletions(-)
>> 
>> ----------------------------------------------------------------------------
>
> Build fails on s390 using defconfig with:
>
> In file included from drivers/net/ethernet/mellanox/mlx5/core/en_tc.h:40,
>                  from drivers/net/ethernet/mellanox/mlx5/core/en_main.c:45:
> drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun.h:24:29: error: field 'match_level' has incomplete type
>    24 |  enum mlx5_flow_match_level match_level;
>       |                             ^~~~~~~~~~~
> drivers/net/ethernet/mellanox/mlx5/core/en/tc_tun.h:27:26: warning: 'struct mlx5e_encap_entry' declared inside parameter list will not be visible outside of this definition or declaration
>    27 |  int (*calc_hlen)(struct mlx5e_encap_entry *e);
>       |                          ^~~~~~~~~~~~~~~~~
>
> caused by this:
> commit 0d9f96471493d5483d116c137693f03604332a04 (HEAD, refs/bisect/bad)
> Author: Vlad Buslov <vladbu@nvidia.com>
> Date:   Sun Jan 24 22:07:04 2021 +0200
>
>     net/mlx5e: Extract tc tunnel encap/decap code to dedicated file
>     
>     Following patches in series extend the extracted code with routing
>     infrastructure. To improve code modularity created a dedicated
>     tc_tun_encap.c source file and move encap/decap related code to the new
>     file. Export code that is used by both regular TC code and encap/decap code
>     into tc_priv.h (new header intended to be used only by TC module). Rename
>     some exported functions by adding "mlx5e_" prefix to their names.
>     
>     Signed-off-by: Vlad Buslov <vladbu@nvidia.com>
>     Signed-off-by: Dmytro Linkin <dlinkin@nvidia.com>
>     Reviewed-by: Roi Dayan <roid@nvidia.com>
>     Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
>
> Note: switching on NET_SWITCHDEV fixes the build error.

Hi Heiko,

This problem is supposed to be fixed by 36280f0797df ("net/mlx5e: Fix
tc_tun.h to verify MLX5_ESWITCH config"). I'm trying to reproduce with
config supplied by test robot in another thread (config: s390-defconfig)
and current net-next builds fine for me. I've also verified that config
option you mentioned is not set in that config:

$ grep NET_SWITCHDEV .config
# CONFIG_NET_SWITCHDEV is not set

Can you help me reproduce?

Thanks,
Vlad
