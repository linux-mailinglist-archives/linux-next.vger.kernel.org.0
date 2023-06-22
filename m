Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B62373A2AE
	for <lists+linux-next@lfdr.de>; Thu, 22 Jun 2023 16:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbjFVOKW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jun 2023 10:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbjFVOKV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2023 10:10:21 -0400
X-Greylist: delayed 91 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Jun 2023 07:10:16 PDT
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACEA1AC
        for <linux-next@vger.kernel.org>; Thu, 22 Jun 2023 07:10:16 -0700 (PDT)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
        by cmsmtp with ESMTP
        id CIN3qj815WU1cCKzNqMljx; Thu, 22 Jun 2023 14:08:45 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id CKzMqtx7vuV0ZCKzMqZ5QE; Thu, 22 Jun 2023 14:08:44 +0000
X-Authority-Analysis: v=2.4 cv=NN3GRm2g c=1 sm=1 tr=0 ts=649455ec
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=of4jigFt-DYA:10
 a=wYkD_t78qR0A:10 a=Qe6B47XUAAAA:8 a=6N7Yd5KtQ_qG7vqdfvQA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=QWPKR-PWjQKaio0naagv:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=n5PserBqTU9pJTim+3fzKOkxgVhX1AauMCTNazI9mVQ=; b=zSpGVT94xBstFCH5TMotptKujm
        y0iNyfoq26cvln04rn7FAjKDEYBf6jdPRFsSg0cuzAuOH16bH3Z6/RriMMHFPDLIV5g/Z/BAiMj5e
        0K8J3A08o4WCBdzGlyd5yr4fE93DfJkrgsI5j4KxGemUlXq9fTwMpIpx2CaxOWVW/aIyZ/tvTyUAf
        oNsuM8ZpFmX5HiHpcloOfGOKth6htgyfL/oJMsybny36hnYzhfrb41B4sAD212ThMZjlWGbUMRxCp
        cLCMPzOPnxL6hjo76hk4b7fygRJFluBDnaU0E6Dt+0UqsL0efJJe3Z4GIIEO6lz8cAfVRmN6RTXx7
        lJp5QfVQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:46156 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qCKzL-000Bg4-KH;
        Thu, 22 Jun 2023 09:08:43 -0500
Message-ID: <9b1f62bd-47b2-be64-4d09-7f6f2d52b3bc@embeddedor.com>
Date:   Thu, 22 Jun 2023 08:09:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH][next] cgroup: Avoid -Wstringop-overflow warnings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
References: <ZIpm3pcs3iCP9UaR@work>
 <361c2f87-1424-f452-912f-0e4a339f5c46@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <361c2f87-1424-f452-912f-0e4a339f5c46@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qCKzL-000Bg4-KH
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:46156
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMxPjsdptKpN8NvD1RrrqoeTP/Z3N5Rk5qarJJCvZNw/T8U3dDs1T7TcTfE82dBIZbQ7s1IEKe1Sd3PCGKogFgIjmD9MnTcJ4mguhj9qy+GoREiXgyar
 v4v9tG7nKg6WHnytoBTBjlvVyakxfZL+YAvAMUvaa8iM9HnYefiX1BUSlEvLw52/8VwbNClJfqgNb6veb5iNOgQEyqZN0OVSX6gTvSWnYfPpw4B6P/adULZP
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi!

On 6/22/23 04:20, Krzysztof Kozlowski wrote:
> On 15/06/2023 03:18, Gustavo A. R. Silva wrote:
>> Address the following -Wstringop-overflow warnings seen when
>> built with ARM architecture and aspeed_g4_defconfig configuration
>> (notice that under this configuration CGROUP_SUBSYS_COUNT == 0):
>> kernel/cgroup/cgroup.c:1208:16: warning: 'find_existing_css_set' accessing 4 bytes in a region of size 0 [-Wstringop-overflow=]
>> kernel/cgroup/cgroup.c:1258:15: warning: 'css_set_hash' accessing 4 bytes in a region of size 0 [-Wstringop-overflow=]
>> kernel/cgroup/cgroup.c:6089:18: warning: 'css_set_hash' accessing 4 bytes in a region of size 0 [-Wstringop-overflow=]
>> kernel/cgroup/cgroup.c:6153:18: warning: 'css_set_hash' accessing 4 bytes in a region of size 0 [-Wstringop-overflow=]
>>
> 
> Hi,
> 
> This patch landed in next but causes boot failures on
> Exynos ARMv7 board (32 bit) with systemd (exynos_defconfig):
> 
> NFS-Mount: 192.168.1.10:/srv/nfs/odroidhc1
> Waiting 10 seconds for device /dev/nfs ...
> ERROR: device '/dev/nfs' not found. Skipping fsck.
> Mount cmd:
> mount.nfs4 -o vers=4,nolock 192.168.1.10:/srv/nfs/odroidhc1 /new_root
> :: running cleanup hook [udev]
> [   23.752917] systemd[1]: System time before build time, advancing clock.
> [   23.851828] systemd[1]: Failed to mount tmpfs at /sys/fs/cgroup: No such file or directory
> [   23.868459] systemd[1]: Failed to mount cgroup at /sys/fs/cgroup/systemd: No such file or directory
> [!!!!!!] Failed to mount API filesystems.
> [   23.914562] systemd[1]: Freezing execution.
> 
> Full log:
> https://krzk.eu/#/builders/21/builds/4110/steps/15/logs/serial0

Thanks for reporting this issue. I'll take a look.

--
Gustavo
