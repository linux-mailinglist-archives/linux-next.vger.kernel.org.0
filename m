Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CD863B60B
	for <lists+linux-next@lfdr.de>; Tue, 29 Nov 2022 00:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbiK1Xja (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Nov 2022 18:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbiK1Xj2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2022 18:39:28 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479585FBB
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 15:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1669678767; x=1701214767;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CKWGkAJZOpqvsRiv6iiFtDdJkkDaLWB71/7EyG0/hlw=;
  b=RKeXn64tebAIyn9SUjLygkcydAqItUltt8kuDdEjTNU9O51GvgWiSJO2
   DelSY+j+Ak4ecaxCNlOlRZ6JCvUC3KqDJ8kHLHL5RZVQ80polB3ZXD2Dh
   wYPifuM+HODd34OAxVOlZhVR1hplTxL699xwwLZNlLuOnsYRT2teAOxh5
   VbFat04Zg/px+9IeAh36BO+cAWlrC0iKISe4XkFZ2uc4HB/WT4Bw43L61
   V3pGi5GyDwgQiI27mB8ywod2sFkTMnVh41v/5eTQiCwq1zxVnvCXfxha1
   M9rn2kwEfAcedU2StpsF7WdUlvfHKNLjhe6dOkFslcKHADX4rDpfhJxQ1
   w==;
X-IronPort-AV: E=Sophos;i="5.96,201,1665417600"; 
   d="scan'208";a="329497040"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2022 07:39:26 +0800
IronPort-SDR: +KRpBk+jvhlJxO9gCmtPJoD6ykkd/7H7gL2cnMve8BAQDZzgRBhrWsJCC8xWD7EgSqoW6Rpxn/
 mZSGS+1RDgoYWKKn4xeql5Anp2Zl7ELKnnB6jzshPdUB+Pt6pIoTI4osrOQ76mAHxyiCRH/+lg
 z+dq6E7G/qvulIUT/c0rYHB+19TQg4S6QcC2/UuJKagHlN63qiRwilwW8ZSo3zk7/IGaKrNmD6
 ZkW1kS0rxkXb4s0RMSL1M/ThPUZAnu9DEhFKpA3cwydCAYGUpNTezxIc94KdSLHMjflcsBSjdO
 rWw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2022 14:58:07 -0800
IronPort-SDR: J1ezDXIHB6HbaxJnr1BPPaGh3PvfCQDNWl59FNkkWwquPjdxkZfqUrRk+QCp7VSJ6quGDT8u83
 0meMZ/FNWpEH/u8x2TqZ03oJ14A1ZKTPaElZPR8H5dAEfdcdjfKBrMhAfc9r+JwzRd7iprJx8S
 q2ka1vJSLGR26GRWMO2crT8DgI9sADTe+XaiJwXtMkEX88v3an4XDp3XyxiZZM+WIzDcvi22Ng
 ypN4nUwOjZaoybTVUc65yBqINz1DJXFjGd803BLRA+Yy/iuR36uA7IOSmZfFbA/ePtImAFzdjs
 YO4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2022 15:39:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NLhl23Cd7z1RvTp
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 15:39:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1669678766; x=1672270767; bh=CKWGkAJZOpqvsRiv6iiFtDdJkkDaLWB71/7
        EyG0/hlw=; b=TH33QpIju2od0JJjgMhJh51ZiGLvuI5P1zoI0B7QZProO1P11d1
        fS251GW9UF6gA4O8Rw3w/0YkRK1PQpR7tGOC0DGWyPNlDGJwH+IzVWlo0HLQu0sR
        a0lTqCrz6ZUd4rsGcuQzPvS/r+0hIJXbbDZ8iCOEsZnpcKWjnMngGxaYJXXh2UVW
        VbvIXe8MTGwHt08eN9a3OvXhpUS8HYFkabXQDh1wl8XDWxjjeRA+BLjbDabxiCl5
        PRyPBeK2Dy+gU4H8FDa3L8AZjSr8E1wFPvRtvi8iiVAo4Z+egLwA5XWqKsdxcJWG
        22oIJxjj603T/rTv0WTSHlS94dqU4ZWe5jA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BrAB8lDBXJkw for <linux-next@vger.kernel.org>;
        Mon, 28 Nov 2022 15:39:26 -0800 (PST)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NLhl13M9hz1RvLy;
        Mon, 28 Nov 2022 15:39:25 -0800 (PST)
Message-ID: <ab5368d2-5f65-68cb-9703-23d6e451b775@opensource.wdc.com>
Date:   Tue, 29 Nov 2022 08:39:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221129082715.78e44566@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221129082715.78e44566@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/29/22 06:27, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   4b49197f9fbd ("block: mq-deadline: Rename deadline_is_seq_writes()")
> 
> Fixes tag
> 
>   Fixes: 015d02f4853 ("block: mq-deadline: Do not break sequential write streams to zoned HDDs")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

Oops. Sorry about that. It seems I cannot count up to 12 anymore :)
It should be:

Fixes: 015d02f48537 ("block: mq-deadline: Do not break sequential write
streams to zoned HDDs")

Jens, can you fix this ?

-- 
Damien Le Moal
Western Digital Research

