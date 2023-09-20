Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C5C7A881F
	for <lists+linux-next@lfdr.de>; Wed, 20 Sep 2023 17:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236516AbjITPVh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Sep 2023 11:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236524AbjITPV3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Sep 2023 11:21:29 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0F0DE
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 08:21:23 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-690b8859c46so2467679b3a.3
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695223282; x=1695828082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nj0Up56e4jhyRDntXlBwHRnq4btg0+rUisOZhPGaioQ=;
        b=A2EinCJTPtH1Z4lee6/41cn441LaUdcovCxX4yf939aTKp6J/gmPpbcH9ovw26szFo
         ImfnJFst48RV4bnPMC2CjJxYIJV+Np7Ukl/oYE0DehLMuknS4TNx7868OJ5Nwaqq6OLJ
         YgXLfiOP8r7laaLVsg76U0AlLKrCN7VV2JfJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695223282; x=1695828082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj0Up56e4jhyRDntXlBwHRnq4btg0+rUisOZhPGaioQ=;
        b=Y+sWS2H3mGFj/QG8yxn/4QHHM8Z2rYiR4PYLkZC14H+b9PeyIresCKqnXG6k/7vtDb
         ogwghkI6eVPszFYYTuq3opSujsx9Gb11htU/UaWyWCLGVoa904nOj/eQD7QMYJpeUijU
         sascCUbR+3NDRPHcTEjGeFiOF71yf3Mc2l48TC3yxf4OenCfA7gT3jhR9btTqN0hHR7F
         zTQRnnhCOYbdH9K0/9QrmF7Bj7oJLMGdPh4+vn5BN1KZxBk6mPuQyrY/9oydcwe+rlZq
         pSsDKyPWLnUpFsX1yPRJzOWJgDQofkA8VNbnCv1yP0PKDxyAWXgxC97/NhJFxdHnCYoq
         AXhw==
X-Gm-Message-State: AOJu0YxB+7+MKL5InL6RLsspsUE8P1awo5ioGDA0N9OaG1qmUzIcbd8S
        75541dxTnrbQKaJFugX4gARU9Q==
X-Google-Smtp-Source: AGHT+IFPYnfY4ZnT4mS9lyLDNarWzh8z6aSCWPIWyTeIFEaiQYdFrwRvYO2C7rT3RNjJEk08REBh2Q==
X-Received: by 2002:a05:6300:8002:b0:157:877a:5f5e with SMTP id an2-20020a056300800200b00157877a5f5emr2137943pzc.61.1695223282582;
        Wed, 20 Sep 2023 08:21:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s22-20020aa78d56000000b0068fc48fcaa8sm10279190pfe.155.2023.09.20.08.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:21:21 -0700 (PDT)
Date:   Wed, 20 Sep 2023 08:21:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: linux-next: Tree for Sep 12 (bcachefs)
Message-ID: <202309200813.C46E52F4@keescook>
References: <20230912152645.0868a96a@canb.auug.org.au>
 <202309131803.6A3C1D05A@keescook>
 <20230914193807.ozcmylp6n6dsqkbi@moria.home.lan>
 <202309141708.C8B61D4D@keescook>
 <20230919212318.6kr772hz3m5dsyck@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919212318.6kr772hz3m5dsyck@moria.home.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 19, 2023 at 05:23:18PM -0400, Kent Overstreet wrote:
> On Thu, Sep 14, 2023 at 05:20:41PM -0700, Kees Cook wrote:
> > Because they're ambiguous and then the compiler can't do appropriate
> > bounds checking, compile-time diagnostics, etc. Maybe it's actually zero
> > sized, maybe it's not. Nothing stops them from being in the middle of
> > the structure so if someone accidentally tries to put members after it
> > (which has happened before), we end up with bizarre corruptions, etc,
> > etc. Flexible arrays are unambiguous, and that's why we committed to
> > converting all the fake flex arrays. The compiler does not have to guess
> > (or as has been the case: give up on) figuring out what was intended.
> 
> So it does seem like we need to be able to distinguish between normal
> flex arrays that go at the end of a struct vs. - what should we call
> them, markers? that go in the middle.

As long as markers are just treated as address offsets in an struct, I
don't see a problem with them being 0-length arrays. I personally find
them confusing since whatever follows the marker is usually what I'm
trying to address, so the marker serves no purpose.

In the case of finding the offset to a subset of struct members, we
moved all of those in the kernel to using struct_group() instead. But
again, this was just for removing ambiguity for the compiler's ability
to enforce bounds checking (in this case on the memcpy()-family of
functions).

> 
> > Regardless, I'm just trying to help make sure folks that run with
> > CONFIG_UBSAN_BOUNDS=y (as done in Android, Ubuntu, etc) will be able to
> > use bcachefs without runtime warnings, etc. Indexing through a 0-sized
> > array is going to trip the diagnostic either at runtime or when building
> > with -Warray-bounds.
> 
> I do have CONFIG_UBSAN_BOUNDS=y testing in my own CI, so all the runtime
> errors should be fixed now (some of them with casts, but the casts are
> in helpers that know what they're doing, not scattered around at
> random).

Great! Thank you for chasing them all down. If you also have
CONFIG_FORTIFY_SOURCE=y then that should also be checking all the
strcpy()/memcpy() families too. The only thing that may be a problem in
the future is our effort to enable -Warray-bounds at build time. GCC
still has one false positive[1] remaining, but once that's fixed
(hopefully for GCC 14) the rest of the kernel is (was?) warning-free
(in our local testing where CONFIG_CC_NO_ARRAY_BOUNDS has been disabled).

> 
> So I think we're good for now - I'm going to hold off on more cleanup
> for now unless reports of actual ubsan splats turn up, since I'm getting
> a bit bombarded at the moment :)

Understood! :)

-Kees

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109071

-- 
Kees Cook
