Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BEC678CA3
	for <lists+linux-next@lfdr.de>; Tue, 24 Jan 2023 01:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbjAXAMF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Jan 2023 19:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbjAXAMA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Jan 2023 19:12:00 -0500
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3423233E1
        for <linux-next@vger.kernel.org>; Mon, 23 Jan 2023 16:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1674519116; x=1706055116;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Xy0S4tydBQLsREe4methXzx1qb/et0hP72ULQQwMdGo=;
  b=QJ9TVNWvqBLPHDzPF5mh3bc55NYP9TGPEVQtO5ff2LvNRUGjV5fiMuez
   jacadSlBjFmEJN4v2GYBASmH1clzoicnbleC/2dq1+D8U9BdZ8eKOe5fs
   BZ1vlxNdcwuz8PF3kZDRTsh2d8vEqcJVMCNu3XJzmuIU1k3PZDwAyqW7Z
   NWh7h9ILtNyBXsFF/ucoX8Q1Boi9QfPbmLo9eZ6LVbMrVCWK1REtjbeK6
   FuqstY/Ul8fUcKc75VmfFk4euRq/v/L3RTtWQaXb5y0siNqYbC7d8+0aC
   +VRxfXNoYWho1npWnPmYwjDwo0LrlxrMNM+fKkspPPzYnleHET92blf+J
   A==;
X-IronPort-AV: E=Sophos;i="5.97,240,1669046400"; 
   d="scan'208";a="221659157"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2023 08:11:50 +0800
IronPort-SDR: mKLPoILeUz6IIsx7k7NRChWfE9zqx/WRPWrHqueuvWYt/MKlUcrutaJxFJX0EhMxdOHuEFJ0np
 ZQScEagPgxh3Wdrnbfha16Gko8+EUhB81N6m6WCryUr4A0REh+jXk6KyCIHiEFHelypP5M6meV
 D7Js05e/pybBg5Ovg5Cd4iL2c4V47GuJR5+MgBLVKt48gD+4WnQO0leskAn2p49t0lVZV1/pD4
 Gqd1H1iJ/t2MnjSM3N3Edivh4IIwwhIyrOTneNLZ53pLt0HkG33Og0kehkVNfw5ywsQuRqztff
 L5o=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jan 2023 15:23:40 -0800
IronPort-SDR: GuJb59Q6gGQIYtEXz6TvfYYhB46Q0hQJ1GlaodQvs4SJ+O3LLw/pX0n0uPn+Lh4XKOj0UHkOTM
 3k8DJAiAvXEJ4fZQS7RZ6MuZ+Go1idsUev8GTieBVlykWJbc9JWBRiDT3fU0z8yWeM/r2nCjXF
 WC6Pfy3fK2UvphwviN6IlBoTkE/K8FZnELLp2F0fdcqu5PvcJanzfbJnCsWAwkBZ9IusHvLMK4
 TVh4lDYr0REuDCQ1rvZfp8OKhqBkhJs3eLvvNFYmaFWEH2IzIvL+Ogmpx01VCzsFfRk4RwZIU/
 /8w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jan 2023 16:11:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P16pZ5nhlz1Rwt8
        for <linux-next@vger.kernel.org>; Mon, 23 Jan 2023 16:11:50 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1674519110; x=1677111111; bh=Xy0S4tydBQLsREe4methXzx1qb/et0hP72U
        LQQwMdGo=; b=jLiwz6zGhpz696NE03KG9wTsTl14PCK1gPlySp1FYS5efzxPlNC
        qdcBiawTFomwNFE6gzuFBCi3BzFiOLeZaRNk6Xwng+nVpwN7r5KDd3h+0P8NiPo5
        VR4pv1Y7Hk0wIfLK9JmlACy6r8Aoo55l/+T/ywDGnXG9Evus2JPx1JSZyX+DUQfE
        4uSGjO2vJcFIgvu0WueuilR0n8Z+XhuOB9J91HyK634zLFiOC/HhrkN/XzeTWfIf
        fCJxWOuIOPTmtnGOJTv8wTFdQl8J2p0Rfn78/LH/Lr3L90hK/M9bQBdNI+oZVTgB
        ft09hjaKX3Gu9dzk1VdQ9Gj2YxLvnW/fwog==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id uRLY9OFu8thY for <linux-next@vger.kernel.org>;
        Mon, 23 Jan 2023 16:11:50 -0800 (PST)
Received: from [10.225.163.51] (unknown [10.225.163.51])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P16pX6mrnz1RvLy;
        Mon, 23 Jan 2023 16:11:48 -0800 (PST)
Message-ID: <8871d62a-b87f-75d6-fb5d-d9811a3e5dae@opensource.wdc.com>
Date:   Tue, 24 Jan 2023 09:11:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: manual merge of the zonefs tree with the
 vfs-idmapping tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Christian Brauner <christian@brauner.io>,
        Seth Forshee <sforshee@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230124085951.59eb8da3@canb.auug.org.au>
 <1631b427-9efd-cd26-5dbc-0143097f859b@opensource.wdc.com>
 <20230124102535.1e21a533@canb.auug.org.au>
 <87958074-baa4-b6c9-da0c-d654e4009611@opensource.wdc.com>
 <20230124110745.5c9b78b0@oak.ozlabs.ibm.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230124110745.5c9b78b0@oak.ozlabs.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/24/23 09:07, Stephen Rothwell wrote:
> Hi Damien,
> 
> On Tue, 24 Jan 2023 08:30:29 +0900 Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:
>>
>> OK. I think I will merge the 3 patches that create the conflict and rebase
>> the patches. I need that for retesting at least. But given the size of the
>> conflict resolution, I may push that as an update to my for-6.3/for-next
>> branch. Let me see...
>>
>>> Alternatively, just leave the fix up to Linus (but mention it to him
>>> when you send your pull requests).  
>>
>> Understood. Let me retest first :)
> 
> When I said "merge", I meant literally "git merge <some stable branch
> from the vfs-mapping tree that contains the conflicting commit>" not
> cherry pick the commits i.e. you would need to coordinate with
> Christian about having a common branch (or making sure that the part of
> his tree you pull in is immutable).

Yep, cherry picking did not work :)
I did a merge test and came up with the same resolution as you did. It
looks good. It looks big but is in fact fairly simple. I will keep it as
is and signal it to Linus when I send my PR.

But retesting everything to be sure there are no issues.

Christian,

Next time, when you touch an fs, please cc the maintainer for acks. I had
that zonefs series ready for a while and we could have coordinated for the
conflict...

-- 
Damien Le Moal
Western Digital Research

