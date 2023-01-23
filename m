Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61176678C0B
	for <lists+linux-next@lfdr.de>; Tue, 24 Jan 2023 00:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbjAWXag (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Jan 2023 18:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjAWXae (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Jan 2023 18:30:34 -0500
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E72A16AFD
        for <linux-next@vger.kernel.org>; Mon, 23 Jan 2023 15:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674516633; x=1706052633;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3lBUQWNnwjuiaJATRUvrlUmP//VbNgiTH5V5gmyopKM=;
  b=RuJveqbSJyZGXM8EQR1NWTFjZA3ULcsUQMN+NIIrPjBn24zRcxU8apQY
   Nq7zj2CLfoIofjpSFpTmqYefF1Xeg0TFmPaaQtXSe8qg2hbDoIemgKWUa
   xGgl8nCALQvG5gdDwo7DJG6YTa2E7FmAIO8yPrIcOH51kn+YPkYW3GghE
   ci+GCHBjZWFq2ZfIN5xvhkCTSfl55aVmAhjuwu4xI5n2JFRojA3vNgTUV
   DfRdfgjvgKgVargmU6A2L08F0uQugxqfOEiiKFYHNAvF12esAxpDg+Ngn
   yhv4dtTQ9R/CUjfzk4STy1krUdjYFTHupHB36mNEt8v7buhfXdAbHg8KZ
   g==;
X-IronPort-AV: E=Sophos;i="5.97,240,1669046400"; 
   d="scan'208";a="221656608"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2023 07:30:32 +0800
IronPort-SDR: ZyIjncyRo1Y3Gau/lAEAZNuIkZCZ6vqf2MUy13g6hUeXv/rjMZjhyNR5kqej++4uuGYej2T94e
 ep3BkJ6vZFxjIzcfAbmo1+9QAGuj77LL8n+O/VIxu3oCfS7rggk0rdMgG6UqsD6QPV6Rj8i4/v
 ExZWOE048XpzET9St1G3xuyT+lHZtFOMMSP5Jv3F09nJmUdgYVSpO44lvjL61WStDZ7zKeHGmV
 oWwStwIJbSbXekDs6BuyH8FqCub8arPS1CQoaGCpp/vR6firvFN6ye24BAMomOL3Bh1XDJ0P/T
 W9I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jan 2023 14:42:21 -0800
IronPort-SDR: GT3jYPUKaWwY4YOL40QJjoc7RUhtmS8OxA/CcXy6zjWfCNpQGXf/SM+nJKNcLyalo4R+epZDVf
 bE+7wKKt1xdCJu9gV+e9NI0aoqlAK9VC9qdHTss/dvnWv7FRoD11DUOW2jijmrmMPK44RIQ2Tl
 Cuj0Cwcp7FewSvKGgc5/4oSyFWtCeANPbrUw2PYFuzB/yAbTWf0jo3rqfyZIPsU0BKaGxD1Qpf
 MCYFLy/X2ffdx9gD4Xb5d4cpX836jpDstdQjy/4Wliddmq9WRDXXfS2jO5BVLjdqHJhW6NJHob
 YiA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jan 2023 15:30:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P15tw3LWpz1Rwrq
        for <linux-next@vger.kernel.org>; Mon, 23 Jan 2023 15:30:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674516631; x=1677108632; bh=3lBUQWNnwjuiaJATRUvrlUmP//VbNgiTH5V
        5gmyopKM=; b=VVOLmqsei+FhMOs3bMvMEY6jTbthYjyoMB81T+7vTWyoEjz7caQ
        J23eitrBN63MNPz129Wyk6k2r7VSXmSu/onUW1sTuVmehqV8fTL/3D2MHZJeyVwi
        VCcRc9ph0D0DOCIXMbq3CESnk7QhFjWS6rH/xxQs9BhAa03lyci7/UFB7Fj3OJrQ
        86lRwEeW5UeJXBTGMTZ6OWFVxGYwFybMRU/s/9mh62Qf43N/ox7YCDBb7WjoN9fE
        o9RmhQSJBFxjb3aiDmBaNw6hrDF+K5oGzl8+fHGnrnWVHtDyy+mCDcUmhAtkWDld
        tfI7jfE1Zerpx2NGCvrQbvlINZJkMK2t5YA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id iF3H7V7KKeAk for <linux-next@vger.kernel.org>;
        Mon, 23 Jan 2023 15:30:31 -0800 (PST)
Received: from [10.225.163.51] (unknown [10.225.163.51])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P15tt5cKgz1RvLy;
        Mon, 23 Jan 2023 15:30:30 -0800 (PST)
Message-ID: <87958074-baa4-b6c9-da0c-d654e4009611@opensource.wdc.com>
Date:   Tue, 24 Jan 2023 08:30:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: manual merge of the zonefs tree with the
 vfs-idmapping tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Christian Brauner <christian@brauner.io>,
        Seth Forshee <sforshee@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230124085951.59eb8da3@canb.auug.org.au>
 <1631b427-9efd-cd26-5dbc-0143097f859b@opensource.wdc.com>
 <20230124102535.1e21a533@canb.auug.org.au>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230124102535.1e21a533@canb.auug.org.au>
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

On 1/24/23 08:25, Stephen Rothwell wrote:
> Hi Damien,
> 
> On Tue, 24 Jan 2023 07:31:18 +0900 Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
>>
>> Thanks for that. Do you want me to rebase my for-6.3/for-next branch on
>> these patches ? I need to retest everything anyway, so I might as well do
>> that.
> 
> You can only rebase on top of the vfs-idmapping tree if you get a
> guarantee that it is immutable.  In any case, it may be better to merge
> (an immutable subset) of the vfs-idmapping tree (and fix up the
> conflicts) rather than rebasing on top of it.

OK. I think I will merge the 3 patches that create the conflict and rebase
the patches. I need that for retesting at least. But given the size of the
conflict resolution, I may push that as an update to my for-6.3/for-next
branch. Let me see...

> Alternatively, just leave the fix up to Linus (but mention it to him
> when you send your pull requests).

Understood. Let me retest first :)

Thanks !

-- 
Damien Le Moal
Western Digital Research

