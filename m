Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6346C5B84
	for <lists+linux-next@lfdr.de>; Thu, 23 Mar 2023 01:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjCWAtR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Mar 2023 20:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjCWAtQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Mar 2023 20:49:16 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A163C0E
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 17:49:15 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id l7so3004703pjg.5
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 17:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679532554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFinEt8kHc7HQLo+1UsNq4JpKO4209Jy1HzJsb1u+qk=;
        b=tSPmm7XzHxdrOtOYSJ9lf0e6pwuA3cihNFEXId0XA72Duarh0XB3OjjFwSf4zbAHpL
         5cIQOZ1xF7sTNtjfzqMVpEunKYsmhtVxeJZEBVJiueftjO+m0+mpdsPKyqEjo1dJbROG
         LhXAPeLcAEuAvIyw0cHVOtSeRJ00ZxWRaHe3CJELjtOah3HkF29hS3nXf4qbblnjuMu2
         bTe57X/XXd3QzGQmJF6f7JTXDlZEeVmag4Fll46LAhnrfoS9mfcLyTprNCKEubcWoE4s
         RZkpd1ajyBiS+Er7l+3hbgl2wnUycCuOMBJzXXBXWtOrc++utfClFA+wFfcehlM8Mmn/
         cvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679532554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFinEt8kHc7HQLo+1UsNq4JpKO4209Jy1HzJsb1u+qk=;
        b=IDtG65HO21fDGThk+JpjVV6HEPsUQ+MaMJ8zvUTGRlPgWfV4SZi+xDa8DhLlcOATeH
         OkweNtyr/q13fiLDOxj3ELaB6V6Np//s+QwBDiHVGhhoYNDWAVlhtIJnBv7bTm2+7Khp
         vRW0UEfAu3uGGP0888L82IZ/MwPHF6rlS4wn19PD8yymIx4Y481ns7oCz9e55cEQhF7J
         OU5Sa+FloJOm1swh/uZm50lO0BNj25N8cyJjc5mjid3ACuCn3PixMCXyh14cKHX14K7v
         OcCIZ/vs8q8qiY4CJHo6uzKakvRxrYrcGROKLgN81p/XXyTR8DIvJtPcdMEmUqZmV7tF
         2mbg==
X-Gm-Message-State: AO0yUKVvhXjcV5MyaSX8177seqQQz9FyFoYmOoWhnogbApqbd2G+yPII
        i85OR+yzV3V4x62EDDZUQ8puMg==
X-Google-Smtp-Source: AK7set/Ugqwpuo0LoGUKSS82SOIYdcMIG+P3fgnkCA/4i10sb9Scd9m+KpqKu1/i9BFAcZoJ76V7mw==
X-Received: by 2002:a05:6a20:7f8c:b0:da:4b41:8606 with SMTP id d12-20020a056a207f8c00b000da4b418606mr8717063pzj.5.1679532554375;
        Wed, 22 Mar 2023 17:49:14 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d19-20020aa78693000000b0061ddff8c53dsm10619584pfo.151.2023.03.22.17.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 17:49:13 -0700 (PDT)
Message-ID: <85e0405e-98e7-9610-c76a-de8ab8131a2b@kernel.dk>
Date:   Wed, 22 Mar 2023 18:49:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: linux-next: manual merge of the block tree with the mm tree
Content-Language: en-US
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     David Howells <dhowells@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>
References: <20230323100204.0917cecf@canb.auug.org.au>
 <3431084.1679526799@warthog.procyon.org.uk>
 <82ade7f2-017e-af6b-2fb3-eb1a3f570505@kernel.dk>
 <20230322162638.d940201434ac3a3a29968979@linux-foundation.org>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230322162638.d940201434ac3a3a29968979@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/22/23 5:26?PM, Andrew Morton wrote:
> On Wed, 22 Mar 2023 17:15:48 -0600 Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 3/22/23 5:13?PM, David Howells wrote:
>>> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>>>  +	if (unlikely(iov_iter_is_pipe(i))) {
>>>>  +		copied = copy_page_to_iter_pipe(page, offset, bytes, i);
>>>>  +		goto out;
>>>>  +	}
>>>
>>> This bit would need to be removed from copy_page_to_iter_atomic() as the two
>>> functions it calls should be removed by the patch in the block tree.
>>
>> Maybe it'd be better to consolidate rather than split the changes over
>> two trees?
> 
> fyi, Lorenzo has sent out v7 of this series.  I'll be pushing this in
> an hour or so.  After which I suggest Stephen removes those (now) two
> lines and sends out one of his "build fix" emails which can be the
> basis for Linus's resolution.
> 
> Or I can just steal "iov_iter: Kill ITER_PIPE"...

Or how about we just make sure to queue up items that touch them same
stuff in the same tree? I've already had this queued for a week, and
seems pretty silly to shuffle things around because some thing got
posted in 4 iterations today and then queued up right after.

Plus the build is now broken, so maybe a bit more diligence would be
required here than the drive-by-merging.

-- 
Jens Axboe

