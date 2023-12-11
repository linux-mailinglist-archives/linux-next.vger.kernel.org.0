Return-Path: <linux-next+bounces-336-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672A80D46F
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 18:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B71A81C20F60
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 17:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033714EB33;
	Mon, 11 Dec 2023 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LoVl64DK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C8A9B
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 09:49:40 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-db4004a8aa9so4922240276.1
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 09:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702316979; x=1702921779; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PD4uUBn0YrczoWxlhIt/RaQw+8ZUjArWaAoFtxYQibs=;
        b=LoVl64DKL/uLggQXwWKmK5BOSOGk1xBpRBZsdQ+6bL5OW1U136GD5QZjuN+N7Dqybr
         n+Gh+IPjUV/6LYaspAEBa70k3BFpM0xLw1KhGdw86LEhLTgKylkm636a0oFEzv81UXu0
         AmIzm5OGmwzEfOIzjWJNbJF4EcNPTmxy2pHVBlmNJ8XxAtmxV7dlNkVGTtpV6z+kqNyh
         vAmk8bGkqiESIjLRvZoUxzQUwR74xBy1g83tecDx/AyrAZsA5IInAyrOO+N/A8cG77KI
         3wUN0OVro4Xsiku9bESV/bVEajIwKV1AOUlnjqGpY4dCyis0oIA7Az4L6RnT3CSm/VaV
         cPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316979; x=1702921779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PD4uUBn0YrczoWxlhIt/RaQw+8ZUjArWaAoFtxYQibs=;
        b=MDkfhWHEaTrn5OnmHcTnF/BDyH2CjDzbpQRTrgCc9HMLYB+cQfnuobKXW0DwR4sejT
         g1GYssCs719a5oL1dntUAoxhNkjjUWgfFH3nNp+WvE89B2V8pb6F1+hDQwm8NspIeUKS
         qUdz18Iwacmfcxdziu8HCth3J0ovMRibSDC3PsbMeJzc0Jh4xeO56X67kf3uyfME5rp9
         TedfzcxouZP5RCxFboPi8bKv8zIqrd++c0CZ/puJC5QyzdrS7gl+DV9ykNCf2plJUG5R
         KFzE4tBluuqcydOfpS+A8PVS6S496m4s05FJsIH2rGQ4KPE/69K0ZRuFyo3tpweolRne
         YYlQ==
X-Gm-Message-State: AOJu0Yya0GAVKnDfmMB70vpwlD2HrSDOOVeCzTE8rBBDF40vx2krXjZ8
	JpLBW7gKf45h7oUgX/Sq0cZSLCoSm7Y=
X-Google-Smtp-Source: AGHT+IFKl2rS1vD/lL3s8aIyMZ058IVAAiNTpwfw4dqckX0k3J8fVvuHgdqmRgVwbCkxi+5PiutTudxK29M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:f08:0:b0:dae:49a3:ae23 with SMTP id
 x8-20020a5b0f08000000b00dae49a3ae23mr36764ybr.7.1702316979721; Mon, 11 Dec
 2023 09:49:39 -0800 (PST)
Date: Mon, 11 Dec 2023 09:49:38 -0800
In-Reply-To: <20231211085956.25bedfe4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231211085956.25bedfe4@canb.auug.org.au>
Message-ID: <ZXdLsg1tN4DfBBSy@google.com>
Subject: Re: linux-next: duplicate patches in the kvm tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Dec 11, 2023, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   3b99d46a1170 ("KVM: selftests: Actually print out magic token in NX hugepages skip message")
>   fc6543bb55d4 ("KVM: selftests: add -MP to CFLAGS")
> 
> These are commits
> 
>   4a073e813477 ("KVM: selftests: Actually print out magic token in NX hugepages skip message")
>   96f124015f82 ("KVM: selftests: add -MP to CFLAGS")
> 
> in Linus' tree.

This is my bad, I used the wrong base for a selftests branch.  My understanding
is that we're just going to eat the duplicate commits.

