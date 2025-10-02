Return-Path: <linux-next+bounces-8548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0EBB51B2
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 22:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 20976342452
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 20:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D7F2848B1;
	Thu,  2 Oct 2025 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUQbeT0k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5AB27A904
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2025 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759435853; cv=none; b=lXTE2dL1iIBQfM2EgmZntT435N+4EijUuBFBHcPt06KX17+I95PJLvSex5AJxbhLC6YEox82ilydOgnlAAYgVCjCyEsHu2NZK7M6E9u/ifK+ynsc7HwC8rZFqRg+qqtBwBth12hekPMTeN1NTxB+0CClEwAB6OjGRle1V9PXus4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759435853; c=relaxed/simple;
	bh=zDrJU+xLe4kf0WdPsZx2eTyictNcHlbYnwaLRA0CUyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnxZi6MwPBkWQCDm8EWq3LFTshSzavckkm6i8oW0DgmUzcTpAp8xOI8kn6cAOyUAX8bQEygcIVcKjsXrjtLmeRcnmCNVsSYhWP1NEdQ82eLNgKYt8KbKfzH3Ca69ML+5HP5wjP8KcnbQfiC88TjuFx/PPQ2IVdMaLKQts49r8WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUQbeT0k; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e6c8bc46eso8035195e9.3
        for <linux-next@vger.kernel.org>; Thu, 02 Oct 2025 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759435850; x=1760040650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yptgqm0jFxFfgcs9+GgM4ctol149fL7+2Ynqpr6fO9I=;
        b=wUQbeT0kSd1Ei52hN2AbpiMy6ZdRFGLwKk3UC2jeNh/ys51/BVw+xix+i+de5a25je
         oqYyUgLQLeDgvpZyR5KrSUA+cG/fWrM/eiwAZZepotH32L+B0OLfohI0FSki4aLGWlxY
         l3eluRcfx6rN4DeXUwJiTT4iv0sb4dO12S7zKOZ1Ap8cWZcBNVTc/Kf2dnbaIahK+DaM
         T0NAEGe/UFqWlReJ0Wr0DG7jzSaCAsNBo4BeoVOE9Alzq+M8RY90tO/7BhQgk6T+ezZf
         w5bt8Zruh2/DCR55w4X6s9Kuxvj1qiQl9ju6dVetvmkd04IWrBm3cCE46s0DCuY4WK7R
         FHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759435850; x=1760040650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yptgqm0jFxFfgcs9+GgM4ctol149fL7+2Ynqpr6fO9I=;
        b=pLtS6dxbctJ1Z4VaYc+6af1UUFUUSSufQrWGOQQXUzd5MrMegAn7eFQEVVnmbOAi78
         6hk0TgYyLOFYApScTRLvmtvH10EtmEfCfOraBA3CiVqmtJqK3lwQ4ouBvIoIIprLa8Gl
         2Glhb/zf3D7AyO8jbh3jpz5hFHHuq08Ax7LJoU9gkDyZjt1rKW7ISUwQP2VmjgOgfRJO
         801WkcEyhe+ALWCGYAm40DL+l5S93R/B3A1a2voAfXdyz5KVnYhJ5w2nDHO6gkcNOo0c
         B/8PQ9hQPwmKafonmuTBhGNPGb3Knozm+v8bnRkV8eNe9NcKCKhBNeb1Ayr+vPhAkGeB
         hXCA==
X-Forwarded-Encrypted: i=1; AJvYcCWI+JhHe1WvgIIY1BJonzYRGQ1d0f29IwHJ2LdlK37V16b0H6NClxBhwat5bla+Dc+zYZUrn6CvN2XJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtm7C34FxgiswNSes1baq0gMYnScdI0VNH4qV2QM/aht0hicaC
	qh4dGloVL7ZHhCDSMSrV6u8+uCZgbUnM5tR0z+ru96PrjL4CywA8ef3vq34GejmlmYw=
X-Gm-Gg: ASbGncuk3qOP1INJydaNibgBFK/0WqnHjX1VV308uMrXPrBOYXg1zbxhkHp3m5LcWTL
	aGqopKBgAqFf5dnPL2S+D8jGlGciroGvqaBhc/5DR/f/yF5EOd0lCWYqSMPEKgY1MLDD0W2QrNL
	6U08soSBpBQ4cafTDCW0q9wnUcwt9UwBkPNFPR/biYmkf3Cl3mAWcgUzfOwjCBoVahXq28TZDqP
	sVEdXC/ARZnhYaaDflO9UKjIUiobEH0AwuJKdRyMYutQF2ijtySnekb1nl4HOjNie/x09wLzP7d
	kOei+s3+OiZUwBS0ExGX9nx+9KZiZm2wxVUAoQasp6IBdirTCXBoPRtX4wl/0ZkMdSg59s6zJS5
	5xTf/alYMrwjnMB12PIeAugaEj3k6g6AIAQR/jlL4pZ6/zuBcRGd3RZme
X-Google-Smtp-Source: AGHT+IE7dbQ2YJJtBusQReNmzOLhkJe7Eza2TAVuEVEFU5ygi7MTATEf1xBmhUoH73Id6fwCGteMrw==
X-Received: by 2002:a05:600c:3542:b0:45b:7e86:7378 with SMTP id 5b1f17b1804b1-46e7115d0e0mr3297535e9.34.1759435849972;
        Thu, 02 Oct 2025 13:10:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e693bcc93sm48017395e9.13.2025.10.02.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:10:49 -0700 (PDT)
Date: Thu, 2 Oct 2025 23:10:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Oct 2
Message-ID: <aN7cRUOxq-zwCoZN@stanley.mountain>
References: <aN6qWFc6hIcbRU1o@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN6qWFc6hIcbRU1o@sirena.org.uk>

Rust is broken on today's linux-next (next-20251002) on Debian forky/sid.

regards,
dan carpenter

$ make -j32
  SYNC    include/config/auto.conf
  HOSTCC  scripts/basic/fixdep
  CALL    scripts/checksyscalls.sh
  RUSTC L rust/core.o
error: cannot find a built-in macro with name `define_opaque`
    --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
     |
1757 | /     pub macro define_opaque($($tt:tt)*) {
1758 | |         /* compiler built-in */
1759 | |     }
     | |_____^

error: attributes starting with `rustc` are reserved for use by the `rustc` compiler
    --> /usr/lib/rustlib/src/rust/library/core/src/pin.rs:1946:28
     |
1946 | #[cfg_attr(not(bootstrap), rustc_macro_edition_2021)]
     |                            ^^^^^^^^^^^^^^^^^^^^^^^^

error: cannot find attribute `rustc_macro_edition_2021` in this scope
    --> /usr/lib/rustlib/src/rust/library/core/src/pin.rs:1946:28
     |
1946 | #[cfg_attr(not(bootstrap), rustc_macro_edition_2021)]
     |                            ^^^^^^^^^^^^^^^^^^^^^^^^

error[E0522]: definition of an unknown lang item: `use_cloned`
   --> /usr/lib/rustlib/src/rust/library/core/src/clone.rs:219:28
    |
219 | #[cfg_attr(not(bootstrap), lang = "use_cloned")]
    |                            ^^^^^^^^^^^^^^^^^^^ definition of unknown lang item `use_cloned`

error[E0522]: definition of an unknown lang item: `RangeMin`
  --> /usr/lib/rustlib/src/rust/library/core/src/pat.rs:28:32
   |
28 |     #[cfg_attr(not(bootstrap), lang = "RangeMin")]
   |                                ^^^^^^^^^^^^^^^^^ definition of unknown lang item `RangeMin`

error[E0522]: definition of an unknown lang item: `RangeMax`
  --> /usr/lib/rustlib/src/rust/library/core/src/pat.rs:32:32
   |
32 |     #[cfg_attr(not(bootstrap), lang = "RangeMax")]
   |                                ^^^^^^^^^^^^^^^^^ definition of unknown lang item `RangeMax`

error[E0522]: definition of an unknown lang item: `RangeSub`
  --> /usr/lib/rustlib/src/rust/library/core/src/pat.rs:36:32
   |
36 |     #[cfg_attr(not(bootstrap), lang = "RangeSub")]
   |                                ^^^^^^^^^^^^^^^^^ definition of unknown lang item `RangeSub`

error: requires `format_alignment` lang_item
   --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:623:24
    |
623 |         $dst.write_fmt($crate::format_args!($($arg)*))
    |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
   ::: /usr/lib/rustlib/src/rust/library/core/src/any.rs:790:13
    |
790 |             write!(f, "TypeId({:#034x})", self.as_u128())?;
    |             --------------------------------------------- in this macro invocation
    |
    = note: this error originates in the macro `$crate::format_args` which comes from the expansion of the macro `write` (in Nightly builds, run with -Z macro-backtrace for more info)

error: aborting due to 8 previous errors

For more information about this error, try `rustc --explain E0522`.
make[2]: *** [rust/Makefile:507: rust/core.o] Error 1
make[1]: *** [/home/dcarpenter/progs/kernel/trees/Makefile:1286: prepare] Error 2
make: *** [Makefile:248: __sub-make] Error 2


