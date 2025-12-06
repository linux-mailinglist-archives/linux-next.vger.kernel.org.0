Return-Path: <linux-next+bounces-9364-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A03CA9DEE
	for <lists+linux-next@lfdr.de>; Sat, 06 Dec 2025 02:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CC3F300D673
	for <lists+linux-next@lfdr.de>; Sat,  6 Dec 2025 01:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1F71E0B86;
	Sat,  6 Dec 2025 01:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HAC6J1aZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561AB27453
	for <linux-next@vger.kernel.org>; Sat,  6 Dec 2025 01:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986172; cv=none; b=L9ma374/q+oXbVXkBHkm3sj0HQ0JcvS4bcMG8GIclNJQgHdxIUlyzW1RZqRIz71W2IKJuc8QYDqYC9ZBsBNs0LhCFWfcGyAI6JQaJ8eFT6dvHJUOg8kROIzkLpA0HHrWCK70qKCgmcOQ7OCzHCPcV+VZXOnVr5EtpuT5CtgMehE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986172; c=relaxed/simple;
	bh=83+RRWO7apJfBzROBx4hvA8U2zrlObesJUz5Y/0kEIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luDSYeuVQkt51I2pb8+PEsq6nv3aLrP253E2Jn6rjNhrftokvAKGZIowQGIgxFHxwkZBF+z9agQm6QUZvDGYJvkQ4A3V0d24/a0ohGfY+codi6wyO72VJXZti8MvcsEsFoQRRtRjf+6PHpahHdz5RiEP/Tfv/q0Ag0jaXftTrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HAC6J1aZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b73161849e1so609498466b.2
        for <linux-next@vger.kernel.org>; Fri, 05 Dec 2025 17:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764986168; x=1765590968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NUraw7tomd1KwHLtqTN15TG5fHqupVd001WTjnTGYvg=;
        b=HAC6J1aZUff654Uz51nBgF0OafKhpUeDwuokOY1rdi21iTpZds5IuEazwM8sXKljG/
         Lek+7rxhR5RGXIN95DBPH5kESZ9QJ/2AyZGNsHi8NDT05I62VxeFKmUNz+pprQi0J4Ow
         JlsSE5ZrNILn18kvKIlgfnpedYlBVZP4N8xUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764986168; x=1765590968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUraw7tomd1KwHLtqTN15TG5fHqupVd001WTjnTGYvg=;
        b=HoMZfmz3Un/H3h/dqfEo025/uiimXiWLkR/UV2zk4KXdkrsVKHf1jEt7bxU+bXHRMb
         dpLp29+xYQ7OGfJ/nbihKz5GYQerO2HUnPmhI0446OGDYsdoKEDTZ7ncLLpehhkB5O/S
         oQ9EULK/jumfAtBZ2hVYAPctjVxpXWYpKFrJix0CegWAueZ5mCuDxEx+ihsOzalI6mUs
         N0QRLygw47iuqWj11i73MdO8HCGLfJFF64eLUlBW7rjqSGXfFqf/3UekGYBVeKvVEc75
         Z/9Pf3ZR0F2jIz05yDLtiXMyjY1VEhKqvvimr6REGGIl+AGVVs2oXlne0RC0dntNuvut
         4S4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPyt34AOLQP3I9OhTvUwc4Iv34UTy29mx/0fbj2tQBCRsNu4iljbbNa/TnuKbtK/KmkkKr4sAwPR4/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkz9n4CQbcLqdlSfHG5mGu2qWKA6ktj8bCuyzH1x4RoecflHl
	vmkOTIsZ8eXlwgRoUMjiJOxOrACZNlh90SNeN30Qj2+wjEEPwlzunGXfoFyIG1+rdFkYtj4R+uH
	/uSLkCRbZKg==
X-Gm-Gg: ASbGnctPKmFZguZ5BECYdhWntoDhfUKFo85wOMWSTVFZR/2wfQGvAFSP/Ci4x7KPF0r
	lblrPnkQihsWzLe5jmjHBgGOquKfC78NbtbSsULmbeijXBtoqkwaEAKA1BjLEaOimuA7Cl+p1vg
	Pe9087uTDoIKQf5QFVY4HtOWzj5cmBkDGHOLu5a4kf98GN1+hj4jSusd3Cw+5EuD7ILwgPHxWhD
	QXUjl3NGHBr832rlBX++xNFkjqZD68YlF62tC823BL9P4lSp1nlhTez7q5mZRHnAn94o1RcATk1
	FJ8yB/niGhu7dyJiPkyWQA4BkU5LOwZzQnoAE6dCIgFh1/Tk1iWDriv7CqIzlPmSuOkw5zFg04o
	doxlmDH1Qzj8YrznHUlj6q1j74dWVUwj5FI78J/nZydTh8ruwB4W6xf/dApWWA2lmr0kAmBApy/
	3DjCYIVL6KbOxeTqsjOmhhax6Jtx7AA0xMv5lzY2bdRt98VkDgewnEESOaRPNV
X-Google-Smtp-Source: AGHT+IEMJO3+jCa5ATpvrFCOCkDHfKjSKoEmAIIemAAKbd/0+B+nswcsi82WWCt8eSbu6/9gTSollg==
X-Received: by 2002:a17:907:7f22:b0:b72:7dbd:3bf with SMTP id a640c23a62f3a-b7a247e4e56mr112225966b.43.1764986168564;
        Fri, 05 Dec 2025 17:56:08 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49a4f35sm498962566b.46.2025.12.05.17.56.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 17:56:07 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so4574531a12.3
        for <linux-next@vger.kernel.org>; Fri, 05 Dec 2025 17:56:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhSBHRGiIM/kDesMjJKrWjshz/SxfQp1dy9OI4OATMpIsdNSSbDfjF0hQVcTu7ROR7r01IMdmlI3rG@vger.kernel.org
X-Received: by 2002:a05:6402:3591:b0:640:e78f:f34f with SMTP id
 4fb4d7f45d1cf-6491a3d6986mr760015a12.10.1764986166939; Fri, 05 Dec 2025
 17:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205111942.4150b06f@canb.auug.org.au> <aTIwhhOF847CcQGl@kernel.org>
 <64034c4b052649773272c6fa9c3c929e28ecd40d.camel@kernel.org>
 <aTN6d0Qkh3WKt796@kernel.org> <CAHk-=wh58ZKQTC1iogoMy+Rj+gOuSQM_r2jT3NKD_jiiLyvU8Q@mail.gmail.com>
In-Reply-To: <CAHk-=wh58ZKQTC1iogoMy+Rj+gOuSQM_r2jT3NKD_jiiLyvU8Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 5 Dec 2025 17:55:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj3B1-nZ-4jUP0FsLH4f1bbpO=Q9J88Ziz=wxE-Jm-skw@mail.gmail.com>
X-Gm-Features: AQt7F2r4Tkpag46bSK21rQ-RcZljW4tbOnoIDbARpE-KUFFhl02fOQ06PG8fggM
Message-ID: <CAHk-=wj3B1-nZ-4jUP0FsLH4f1bbpO=Q9J88Ziz=wxE-Jm-skw@mail.gmail.com>
Subject: Re: [6.19 PATCH] nfs/localio: fix regression due to out-of-order
 __put_cred [was: Re: linux-next: manual merge of the nfs tree with Linus' tree]
To: Mike Snitzer <snitzer@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 17:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Let me do that once I finish my "merge various architecture updates".
> I'm almost done with that side - just one more SoC pull to go, I think
> - and can go back to looking at filesystem changes.

Ok, done and pushed out. Can you please verify that the current git
tree looks like you expected?

           Linus

