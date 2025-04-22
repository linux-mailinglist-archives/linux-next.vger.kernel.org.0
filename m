Return-Path: <linux-next+bounces-6335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA7A9746B
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 20:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CAE31B60CE4
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 18:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADDC1DE3D9;
	Tue, 22 Apr 2025 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MS70XE4y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5E28F951
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 18:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745346044; cv=none; b=ZXJEmnPt+W+0ceJ0Cha/R19L8q0R483zm0bS1mK2ptaSuR4Xp735Q29Py+4Q+ooKe1kg4dRIN9q12hBDq3I/EVYwTUQZsDyI5OvFtUgBXjoB/o4DRXbYuS5OHzFhK8TSFPBLa3zjkkO5BMFo4kyh7Y2g6Elii7iizTYT9wdUkts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745346044; c=relaxed/simple;
	bh=BaWFNfK9JaS31xncN4Yvj0mois+6Yk53lz8aI9LBKmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ML2f5MPjy2fyGnVDuGcVyI1mqMeHQBxkxmsyadynKAwOEe5ifQwHDVs1GfBv8xLc9+fQyARG3gmn5CWC547C2JcwJAVUEl1oN22SQi1D6kQ+lLvDPX44MUrj0ybh84zA6u5A1TZ1ZjlfcC4T15S7YN9sJWiMAxzmTYtBPsRA23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MS70XE4y; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso10572362a12.3
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 11:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745346039; x=1745950839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqMSy+hzkSQ4GceWRw6Rn1V3+cta8Qyj2+74Vj1fBmg=;
        b=MS70XE4y2nWBbTghNNind9kZDcA2m++YRM5JzVGC10Zx+7vR+XIVGPYy1loTQ0K9Wb
         bZ6X6+ie02qcRsf/iNeVff9mOnUD4VwT3BYxPFVPVJMN6DQ3pX4aumfBu9zJU6wfOzXN
         qNqPkPUchawvt7dUqC9wl7+XebpUKMOGEwAw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745346039; x=1745950839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqMSy+hzkSQ4GceWRw6Rn1V3+cta8Qyj2+74Vj1fBmg=;
        b=FXTIWBZiF1msaoe8Q//NzXmmdZiFl7uAOs4w4FhDnqEXdZjWHUyVgv0bgDiWBhnc/g
         jb04XeFktF1RM4ntdcdQAzmJ3afYtNU6lQqwCl0GV38YvYU/O3BM0kVkvmqLgW8gRQyt
         OYb5vQP4wnYwltSNF2RZ8q1EkbYxSs8lxc1y0t1ozwxoPdUhs4jlq7Rs2MKyEhG8z8tp
         DiG63ehcm+LCsB8B1cA9btJBP8M+y+P79kA3h6ylzHVLNDSr4l1XOHMtDC3zzr7kt9E1
         oEukV0+6e1HK3i7YMddQieyN4f72NQghDudB931yS0eLbgxnwbjNqKe3Ins9jfTkP49w
         hTFA==
X-Forwarded-Encrypted: i=1; AJvYcCUlqiGzHVgw124Nvx7u2+BtFHcE0etIiDwaVrRZXHp1xZo4wcR489RtaMChwUOMsAzazZsaCZqKjlRD@vger.kernel.org
X-Gm-Message-State: AOJu0YxH2hweH70IjZDzKHQ9/cn1GHyX85LZOO0jtHv0/CwVde2rCT0e
	jhv2p/78GC6Ik66OUlZJS5bZqDdB3PA8IKHP/7I8mGw/iR8Fz4oGrvh0Xmd/mc8LLvzYRxa5YfL
	jkkU=
X-Gm-Gg: ASbGncuRbyEpIIMjXvqyEzmgW72QduDtA5sJ9vj+XRHVNRntsVP5LFng0VY+aznGK37
	vGJcuRmsPQpNAPMnWAN6xCk7BsrMIro4MG2x39+M7DlvnwIldyGYe0xYSuvtxjY2s8EDmwkRGt3
	uj0WfPkJ1jwmkUUmetqwvBm+1RGl/A508fUpfp6u+mkWzljv2da1s747+M5Qd4791g0K5z6Wive
	Fob8zUyG3IE3xVFpwAXu4vEZ2hOYvwtlmzDB5P8lPcyEvFD/AZW5Z2C+o+vzdfigkrDjbGl11fS
	QnwG4GTu8tuHC5qmQUou/NVUmsYzpo9snJOrJ8QV3gD1bsUa39p3o1u7eaTH2F8jlVOUK8qfyYM
	hOYj0X1Cvb0KaoJQ=
X-Google-Smtp-Source: AGHT+IHwqrTid5BI00wc8vaiWhIKvt/W7HpBgLBwI0+zRicPfXkWTPNcwQUQW+QmSOvgr4Nz6gGZUA==
X-Received: by 2002:a17:907:2d9e:b0:abf:6e6a:885c with SMTP id a640c23a62f3a-acb74b3af8fmr1293149566b.23.1745346039370;
        Tue, 22 Apr 2025 11:20:39 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec913cfsm682856066b.80.2025.04.22.11.20.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 11:20:38 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso10572274a12.3
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 11:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUglLLKzgmRNXsugbkeEOeg018tzlj60Tp/NKXWg0cketQAoJnadN++My2/8FMIIA7elP1/CNGMoR4c@vger.kernel.org
X-Received: by 2002:a17:907:7f91:b0:ac3:97f4:9c08 with SMTP id
 a640c23a62f3a-acb74b86ee5mr1613347666b.31.1745346038163; Tue, 22 Apr 2025
 11:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422204718.0b4e3f81@canb.auug.org.au> <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
 <54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de>
In-Reply-To: <54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Apr 2025 11:20:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
X-Gm-Features: ATxdqUE5qwkIreKOuPAeMRSToikdNG5WRtxP2ghs369oZCVZDwu-5kmjTIixvTo
Message-ID: <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of Linus' tree
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[ Adding Masahiro explicitly in case we can just fix cc-option. See below. =
]

On Tue, 22 Apr 2025 at 10:51, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
>
> To disable warnings there is a dedicated macro.
>
> $(call cc-disable-warning, unterminated-string-initialization)

Heh. We have several other cases of that "disable warning" pattern
that does *not* use that cc-disable-warning thing.

In fact, right next to the new unterminated-string-initialization case
(just a couple of lines above it), we have a

   $(call cc-option, -Wno-stringop-overflow)

thing, along with several cases in loongarch and riscv.

So they are presumably _also_ broken, but perhaps just happened to
silently work due to compiler versions (and that stringop-overflow
case is gated by a config option that might also have hidden it from
people).

And as you say:

> Note the "earlier diagnostics" wording. And indeed the real reported
> issue is "warning: #warning syscall clone3 not implemented [-Wcpp]"

so apparently it *also* requires other warnings to actually trigger
problems, which is presumably why Stephen only sees this issue on
sparc* targets.

And which is probably the main reason why the problems with other
cases of this same issue haven't been noted.

Now, the obvious fix is to just convert all these cases to
'cc-disable-warning', and I'll do that.

But exactly because we have at least nine cases of this, maybe we
could make cc-option actually work for this by forcing that "earlier
diagnostics" case in the cc-option test?

Right now cc-option uses -Werror to turn all the warnings into errors,
and thus causes a "unrecognized compiler option" warning to be fatal.

But what if we were to add an intentional warning to the cc-options
test-case, and use -Wno-error-XYZ to make just *that* warning be
harmless, and then 'cc-option' would work for the unrecognized
command-line options for the -Wno-xyz case too?

Because even after I fix all the nine cases we've now accumulated, I
bet we'll have more in the future - just because 'cc-option' is so
much more common (a quick grep shows 429 vs 40 occurrences).

               Linus

