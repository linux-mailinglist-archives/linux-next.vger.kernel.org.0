Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41559678AC5
	for <lists+linux-next@lfdr.de>; Mon, 23 Jan 2023 23:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjAWWbY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Jan 2023 17:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbjAWWbY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Jan 2023 17:31:24 -0500
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1744E3756E
        for <linux-next@vger.kernel.org>; Mon, 23 Jan 2023 14:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674513082; x=1706049082;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p0UtFABJp0hLOaOIqqM+R1Uo6OBWkEwj2jwqHdizZ1M=;
  b=Rle4kWh/uhSUp+efshFNysU8I8VKtK/Qpx5c/7rvfTsfh2IoMZw8M1ig
   YLSzraCzEnE88G1VQ7ZZO3Qf9EMibmo6IPmaSNvgeF4LZ/LYNANLJGwxm
   Mys8JSB4Ywz2QuZBcJhfHR7fPnbdOeKoYMXT2mq/oCNRaoBj17Icj01Nc
   metHoGVSDj8/e63puUBICVZpcp/O6oMG2ivD6T3mGu2Dn8e296SHibd8H
   VZWjKn/BkUFA2aArdRWW1Cn4cAFQckzgUZUsr9YAfQPfNaaDIHLdRJZfq
   m4uZyximbax0vzXVvtHZquy4S3osxURqY9AIO4H8zJv04BkUtiH8C6RiP
   w==;
X-IronPort-AV: E=Sophos;i="5.97,240,1669046400"; 
   d="scan'208";a="226569209"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2023 06:31:21 +0800
IronPort-SDR: Dw5WFOZPZuMd3RpA8kEBnMWoG3a0Bo7vKTDkIXUGKJ86bO59SigKDpeWYw1S+k3oUwkQotgKxf
 SdGammvLuNukoN9RrkPFJZ/U9uTIE8ZqSEnyhQRIekLvk3ago/ptiLrav3mPmJTb3eerhdshxv
 xPAJmpAs8QfpEQd1iDQSp9oymCKHEjzo25VkckkyooYbia64uO3IuN8vUGfu9ChKoimiGrXWVp
 BAXfgjON83hV0WCliwFBFmdmQPBHIuXeha5rJUBwEQ7ftok6UMSOvYTcpEzlX1cYyAjrPab250
 R2E=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jan 2023 13:43:10 -0800
IronPort-SDR: BQqEFNF1T5C+pZW1Mr4V30ImT12O5+cA/iGOWODl5CV2pS0zMegW7vvvbGqRp2mToIdQaC9cvE
 cOoEs4G7OZQmwHYVdB6lbQrf3tikjBehhiwZA62b99Pc3L1q4l0JYaQ48WrWv+ihuQaUGlgKVn
 FC8Hoie8Jzdo+KMuRv+pz/Zb6o4KDRKOrNETF/Ct2U+eluzSRYDiYxFfNF54MHaCdxXyz6+D43
 mKhsT3kJsxpIau9EiT6zonhnjs6pH4Jtdk3TfWEprUjfxd237ASHKQ7Kik4FZwssEiaT2xgmdN
 6AQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jan 2023 14:31:21 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P14Zd5qCTz1RvTr
        for <linux-next@vger.kernel.org>; Mon, 23 Jan 2023 14:31:21 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674513081; x=1677105082; bh=p0UtFABJp0hLOaOIqqM+R1Uo6OBWkEwj2jw
        qHdizZ1M=; b=JT83bXodkT6u4orDLmojlpL28+Hq806G4Ev1UlC99YHKhjjDmav
        WvbmBo2g14NYgwq+xlVZxtBvqyejIYCApLJzyea+vVl2qpb1E2fxbITToa28Xvp9
        6Sc6Gfn+OHm+BLLFD9GpcLKqiS6uy+aYEps+1mDKPFBfInWBHb8ZYN240mwrsKKx
        UZXpHZu/djZVTTnqhK5iv9yRO+EQmLQTKUI6lwwBhAj6JTRVvdomIpXbeca0ziAb
        HgXQqxmedtUB/4ssyEc6cC2mv6p0Q+g7dz1gdT/ZUXCG7J3ykpW44VU0LIrejAlb
        9Iu8hy/pivW5cDwjfuBmRAAExlo3Boo/76w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id tCVaiK4VSSRa for <linux-next@vger.kernel.org>;
        Mon, 23 Jan 2023 14:31:21 -0800 (PST)
Received: from [10.225.163.51] (unknown [10.225.163.51])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P14Zc17Tvz1RvLy;
        Mon, 23 Jan 2023 14:31:19 -0800 (PST)
Message-ID: <1631b427-9efd-cd26-5dbc-0143097f859b@opensource.wdc.com>
Date:   Tue, 24 Jan 2023 07:31:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: manual merge of the zonefs tree with the
 vfs-idmapping tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Christian Brauner <christian@brauner.io>,
        Seth Forshee <sforshee@kernel.org>
Cc:     Christian Brauner <brauner@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230124085951.59eb8da3@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230124085951.59eb8da3@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/24/23 06:59, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the zonefs tree got a conflict in:
> 
>   fs/zonefs/super.c
> 
> between commits:
> 
>   c1632a0f1120 ("fs: port ->setattr() to pass mnt_idmap")
>   f2d40141d5d9 ("fs: port inode_init_owner() to mnt_idmap")
>   f861646a6562 ("quota: port to mnt_idmap")

Indeed, these patches touch zonefs. linux-fsdevel is high traffic and I
missed these patches as I was not on the distribution list. I never acked
these changes. Not cool, to say the least.

> from the vfs-idmapping tree and commits:
> 
>   4008e2a0b01a ("zonefs: Reorganize code")
>   d207794ababe ("zonefs: Dynamically create file inodes when needed")
> 
> from the zonefs tree.
> 
> This is a bit of a mess :-(

Yes.

> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for that. Do you want me to rebase my for-6.3/for-next branch on
these patches ? I need to retest everything anyway, so I might as well do
that.

-- 
Damien Le Moal
Western Digital Research

