Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB121B62EE
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 20:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730143AbgDWSGR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 14:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730029AbgDWSGQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2020 14:06:16 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE63C09B044
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 11:06:16 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d184so3353442pfd.4
        for <linux-next@vger.kernel.org>; Thu, 23 Apr 2020 11:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aMzN8y43RzIeS+hGOjJQmVpyCdPMVYWSbPwa9BUqxsk=;
        b=KQ7SwGEE7BGDgi9nQDxn5/Qf+DVEwwXSpISshGAQFVxxqcofFWkLXI2M6EXYPngQWU
         PgnOirdnEL39LbXQdRpmdcipOkqc+kLm9yJ78NGGM14K3bEqEODuH4goJXgV5DrYzMPN
         9J4hHpHGb1j4OqNvtIKczFHBEXOJQ3JNKWMyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aMzN8y43RzIeS+hGOjJQmVpyCdPMVYWSbPwa9BUqxsk=;
        b=ISQAcKj+AiYEzqEpp8B+h4G7dScZ5l1TZ7nZovCrX5jP4lttoYCv9cQHpzni1nm61x
         s2WuWf6OUoWZjM+UxxECzVh5Rb2Il8e/zv30BSpDrJYO0JlyexPNyIwKS9D8cwUnTT51
         Po34svBTF/6cfq5fFaKZ9GoZCUXu1/1SqRayYOzfORMo1H32mH5DqNKpOnzBjmySomhp
         +bjJKRX6de6qL3HhAXAzAJ2pLZW2wOiw8eEl+tTVA4qb4rhFuXdPybeQckXLgmsaRPhc
         P3nPmHy5v5pfui3luPYEQrIinkEjJXMpjZNUOLfb/c95I2XlOPEljTcSExqzIDn5sEin
         dmSQ==
X-Gm-Message-State: AGi0PuaoNZ9eDpRZ1eUF1qMrkiwj60iid7g9jUBGH8UxsLW8fxyUTAda
        wUyHwlPsJDg5yTsb0OV37YLY+Q==
X-Google-Smtp-Source: APiQypK4H47IY7ViPrvh6uL0870HFLX9QoJ2ivL8CiGjHoztWNMxnsStpejcK6W/BX8+xQ7ExE8XJA==
X-Received: by 2002:a63:48a:: with SMTP id 132mr5156238pge.380.1587665176255;
        Thu, 23 Apr 2020 11:06:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f76sm3118222pfa.167.2020.04.23.11.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 11:06:15 -0700 (PDT)
Date:   Thu, 23 Apr 2020 11:06:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 22 (objtool warnings)
Message-ID: <202004231053.5E4F16C3E8@keescook>
References: <20200422171016.484b031d@canb.auug.org.au>
 <2bf0635d-1406-23db-28c7-e55da9a07e05@infradead.org>
 <20200422164406.qhvd2my35wnjlzyg@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422164406.qhvd2my35wnjlzyg@treble>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 22, 2020 at 11:44:06AM -0500, Josh Poimboeuf wrote:
> On Wed, Apr 22, 2020 at 08:35:29AM -0700, Randy Dunlap wrote:
> > On 4/22/20 12:10 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20200421:
> > > 
> > 
> > on x86_64:
> 
> In both cases the unreachable instruction happens immediately after a
> call to a function which is truncated with a UD2 (because of
> UBSAN_TRAP).
> 
> When I remove UBSAN_TRAP, the UD2s are replaced with calls to
> __ubsan_handle_type_mismatch_v1().

Hrm, these are coming out of CONFIG_UBSAN_MISC, yes? It seems that the
UBSAN checks that are non-recoverable all inject unreachable checks
afterwards, from what I can see.

> Kees, any idea?

Isn't this another version of the earlier unreachable-ud2 issue?

Regardless, the type_mismatch it triggered for misalignment and
object-size checks, and the alignment check is likely going to always
misfire on x86. The randconfig includes that config:

CONFIG_UBSAN_ALIGNMENT=y

So perhaps the config should be strengthened to disallow it under
COMPILE_TEST?

config UBSAN_ALIGNMENT
        def_bool !UBSAN_NO_ALIGNMENT
	depends on !COMPILE_TEST


-- 
Kees Cook
