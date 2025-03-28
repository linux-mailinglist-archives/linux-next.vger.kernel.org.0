Return-Path: <linux-next+bounces-6071-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A3A74E76
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 17:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E6D1882AE4
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 16:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120FB1DA0E0;
	Fri, 28 Mar 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRzTHAcj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD27C1D90B3;
	Fri, 28 Mar 2025 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178739; cv=none; b=URfAHyBTpjIRThdUId9b3txZm2nAPFNpeFIZj6N42g19PZDshoEhCDvns/qPXoutYRI4JlkUcl06/3rGlKlqAHvBJfUtDm5zMA+iH1UV4O1vnnFn6ugl7+w//jwhRxfRWYid1EqUEfc69d1xNVWEnI2AOeawTcGMV0KYKDAlg/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178739; c=relaxed/simple;
	bh=wV24ooZI/rCY1vu1OrdRcQ4Ler9SjAA4oEkZZHvCPH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4y2H9gYY8tqqmorjEFt7ujcxjB1bg55v4xQLJWL+B/ha+GEF7FndiPeZq/wnBNU9BvSVNLgCWx2/3mEGjz1OGVgFPW3iemIAyjzKg3b3WVo/htRlsyPijaK4F9K37k5fReDS12Upa4zMXRKPKJ+G7wusMqDJMxYE9GzyHX48Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRzTHAcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5690BC4CEE4;
	Fri, 28 Mar 2025 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743178738;
	bh=wV24ooZI/rCY1vu1OrdRcQ4Ler9SjAA4oEkZZHvCPH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VRzTHAcjdn7aAxeG5vVPV0/td84oYBFXfqoJb22hF+joKzLyCie/K8RlVSJ8d5cjJ
	 cwlJq9dctFN5YwEEbjS1ZSvjT7uPQhLtpUoZvZyJJflJgG6SWU2cDz4znGVAw2g/Np
	 2jrA2Vw8cXGLRKSVl0Nu8qGuJCucaUNAj2217mmS853Slew1ZHmVAJC4cnuQ9a1Z4g
	 N0AKPnc3PmW0U5WsZde75+I2jFmTEwYpM95S0HVJvwa0k3dZMQgkBke6biBWe4ttyj
	 ngMxpBbfD5WFC2/dMCTCbJ9SsFs4OhremK4jC+kCMr2ogZAbrydq0zPHH3GPPGff7E
	 iD5sE4i+tEsMQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54993c68ba0so2505635e87.2;
        Fri, 28 Mar 2025 09:18:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX60W+zO49GWn91QtJxtVHsCyfX94yd5IZzdn/fBu5nJtoT17KKt/2OyD6gI6R9p/dKUox307qsTsfHKw==@vger.kernel.org, AJvYcCXR9QbtjUaol1ujH3DIiRWgb4YVge5aqKvIS3g/lzvhmEvG6ai64jrxKUx5eyfVwA1rhCpEYyHjBEonFeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3BNjv6yud9JiFWlac3IEjMsw4meaDlz7NkToXTeKt+HgLf/vs
	B6HSScMc/17GQZfF+7r1p1ml3hR/Wz7xr3weAa+MpbWJiCRpe2fqBDFkBeUNtC8ckuRE7b/WzR/
	uNv0nXGwhej6fAjbW+1qF/ug5PTk=
X-Google-Smtp-Source: AGHT+IHPDeqPOqfUwHaSXiyeN8UFMb8y/ZjaaJZAHt2Biu2Dx9L/bCGyqm19JTXOF2Uj8/iCNi1VT8Ivp6jA8Eh5ORs=
X-Received: by 2002:a05:6512:138e:b0:549:8963:eaf0 with SMTP id
 2adb3069b0e04-54b01264b0cmr3464389e87.39.1743178736739; Fri, 28 Mar 2025
 09:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com> <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home> <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
 <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
 <CAMj1kXGLWYrfEzdDXy1wriBycx0DPQ_kL==Jkw_sDW5f0KxEHw@mail.gmail.com>
 <wl7m7xtqg6ftqmkyaabtzsk7lkhxnpkinyehwy6eokvwkfklzi@m6chqm3rht2u>
 <CAMj1kXF68ibzc0_5tPmC7bLBHC0F6w_S7HeYMZeDr8PHo9jzDg@mail.gmail.com> <el52wvltm2ptkyjhiajeo564sa6kcwqihdttvutem2qoegj5rg@wnqe7flapgbf>
In-Reply-To: <el52wvltm2ptkyjhiajeo564sa6kcwqihdttvutem2qoegj5rg@wnqe7flapgbf>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Mar 2025 17:18:44 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFk=tBjPaCJ_f0aiw2K3i8XZehud91y1s-WYc6eRiMVtA@mail.gmail.com>
X-Gm-Features: AQ5f1JoPlnZ9q-R6NuWCNngQFu4LtjTh53xy9mtF8lHtOvktjccYvkCBrVnBTzM
Message-ID: <CAMj1kXFk=tBjPaCJ_f0aiw2K3i8XZehud91y1s-WYc6eRiMVtA@mail.gmail.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Steven Rostedt <rostedt@goodmis.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Aithal, Srikanth" <sraithal@amd.com>, 
	Jason Baron <jbaron@akamai.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, "Roth, Michael" <Michael.Roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 11:54, Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Fri, Mar 28, 2025 at 10:33:31AM +0100, Ard Biesheuvel wrote:
> > Can you quantify the speedup?
>
> Test is below. I run it 10 times on a VM without unaccepted memory. With
> and without has_unaccepted_memory() check in cond_accept_memory().
>
> The difference is not huge, but it is there:
>
> Without static branch:  Mean: 35559993 us, StdDev: 167264
> With static branch:     Mean: 35286227 us, StdDev: 207595
> Diff:                   -273766 us / -0.77%
>

Fair enough - I think this is pretty close to negligible, but I know
that other people may feel differently. At least we have documented
the justification for using a static key here.

