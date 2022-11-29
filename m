Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9518563B83B
	for <lists+linux-next@lfdr.de>; Tue, 29 Nov 2022 03:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbiK2CvA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Nov 2022 21:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235262AbiK2Cuz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Nov 2022 21:50:55 -0500
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A2A490AA
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 18:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1669690254; x=1701226254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UtEbOOvyq7XztzxCqkG/C2315uObCORq8NXAbP7YuVA=;
  b=VTHBWEUZaC221oLZCqHtaLl1fhRxQS8a270/CAB79vRoEdgXZ5lHDyJI
   wsIzlJJ4z75tbnxewbAk0du0p+mhtc6IeAjZjbHo/TXAYJUQkZWdkOMwf
   YWFvCHYa9ew7ZYj/IZHd8WCG2YFojj+3q66eCcNPgaTi2gYOreejUt0EF
   2YcC38zwxYQ0IWrSteysjuKjJ4WfK/T9CZ/nDBMEes58VmmYhzlocRiIF
   1LWPJYxq6+SiVSSd2VJekeXiE3ht7qfobj87WB5FeS5LOVymVGmOA0Plm
   +CF7lrch3Kgmnd9//femWihMjmY4M3w3XcfORWOwesqmHaPEn1I/oiwkN
   w==;
X-IronPort-AV: E=Sophos;i="5.96,201,1665417600"; 
   d="scan'208";a="222565566"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2022 10:50:54 +0800
IronPort-SDR: /OUfPHJInTxfJkfeHpJRLJ1SqguTyHrnWC77oqcP7mTPiHD3HRqW20gPMKfUCg1C56rlAzBtdJ
 AQK6o0wwM9jsfXuOOPn6rt4BlvFgE/gYOBaOXI4f4J+fO7ThJiiSD97UherSSCWFQIck9uYFMw
 zB4XNvOjbdpKrNY2+EInd/9+z6yXuUznTgt1sTSZnXSt0BsaMY24z9e8RzJpucmQTiIfumXzjH
 RuAP9kOk37P1OWHYQvYBBt4GWgqJRm46MQo3/lBfY2oiychAFEyTOikDKgiC168xhfuMFtVc6U
 a5A=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2022 18:09:35 -0800
IronPort-SDR: FMHQPF008mV2LM0SlVoA0ybOXBMhmtbvwdi4eKRQuP+6TO4k7NcvhVETc7Q2Ej4X3ISjj3NBXP
 Xne9J1i7/zPy3I6dFAO5aE6rcvx6XmDEYvcuRsOql9UoFyGxvOAG2utupt8hf94MxC+KqLmM03
 jrhkN0W7g/3nxSaVjqT3/8P37Y5GiTATz8EPc60ImffrDJOtNCnWGBiqLI0gA6cgq0Lczavu3D
 9qSDl26v9RFNlSlzxBZ3NkHYtEgP5aM08/kwcyBwvLYtxsx9T1p1AULD1iSnac3rPXbmKkI0D1
 DW8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2022 18:50:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NLmzx6q2Xz1RvTp
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 18:50:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1669690253; x=1672282254; bh=UtEbOOvyq7XztzxCqkG/C2315uObCORq8NX
        AbP7YuVA=; b=cfm+/pkl4x1dCEhJ/mStoWHTT5cc9whqedlQbIYG6ABRYIZ/iBl
        OX8Ai3DoDCPfBcmDArFcbygRsQBE+dRMhkDFjUBkLp2pWB2O5Nvz7KDXuLwotxQk
        n2zTK9/NDIxranJYzQgWZUUhUS6+Q0WE59RDhVbsrq7KQT8SfflLpFNUpK7H2AJY
        vBYHrngrMn9693Rz3DEPW4ZMIUhXSpnYz5VgDC5JVGUX33IG+sORKPjekK6oJ3Us
        +hQuV1DgT8xwZoRrRYi61lM7DjlvhS8xLelkUsBmxyLcTna6O8ZChlbYmbWxugP/
        VWy4lEHFnGjk7RQ+lPsnAZ1lreCQSAGgJxw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id KaVFTEq2UUvJ for <linux-next@vger.kernel.org>;
        Mon, 28 Nov 2022 18:50:53 -0800 (PST)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NLmzw5mcSz1RvLy;
        Mon, 28 Nov 2022 18:50:52 -0800 (PST)
Message-ID: <89f5e3a2-1cf7-8b9e-f3b9-af0fe4f72c60@opensource.wdc.com>
Date:   Tue, 29 Nov 2022 11:50:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Content-Language: en-US
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221129082715.78e44566@canb.auug.org.au>
 <ab5368d2-5f65-68cb-9703-23d6e451b775@opensource.wdc.com>
 <c03be0eb-1c4c-b8c9-8325-c7769b966ddf@kernel.dk>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <c03be0eb-1c4c-b8c9-8325-c7769b966ddf@kernel.dk>
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

On 11/29/22 11:30, Jens Axboe wrote:
> On 11/28/22 4:39?PM, Damien Le Moal wrote:
>> On 11/29/22 06:27, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> In commit
>>>
>>>   4b49197f9fbd ("block: mq-deadline: Rename deadline_is_seq_writes()")
>>>
>>> Fixes tag
>>>
>>>   Fixes: 015d02f4853 ("block: mq-deadline: Do not break sequential write streams to zoned HDDs")
>>>
>>> has these problem(s):
>>>
>>>   - SHA1 should be at least 12 digits long
>>>     This can be fixed for the future by setting core.abbrev to 12 (or
>>>     more) or (for git v2.11 or later) just making sure it is not set
>>>     (or set to "auto").
>>
>> Oops. Sorry about that. It seems I cannot count up to 12 anymore :)
>> It should be:
>>
>> Fixes: 015d02f48537 ("block: mq-deadline: Do not break sequential write
>> streams to zoned HDDs")
>>
>> Jens, can you fix this ?
> 
> Sure, it's not that important though as it's just missing one digit. For
> the record, this is what I have in my .gitconfig :
> 
> [alias]
> fixes = log -1 --format=fixes
> 
> [pretty]
> fixes = Fixes: %h (\"%s\")
> 
> [core]
> abbrev = 12
> 
> and then you just do 'git fixes <sha>' and it spits out the line for the
> commit without needing to count anything and eliminates this error.

Thanks for the info. Will try this !

-- 
Damien Le Moal
Western Digital Research

