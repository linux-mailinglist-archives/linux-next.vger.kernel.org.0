Return-Path: <linux-next+bounces-3089-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D493785B
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 15:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F4D2826C0
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 13:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0F3126F1E;
	Fri, 19 Jul 2024 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ny+7Hlct"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A3823A6
	for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395303; cv=none; b=Da987OXwFlaVzosWBF1p+oV55zRLb7Y18eTNkyduDV8KxGCc0fV2p9uD6MEXVw2FdHsD5pg5LJTrAHx5RcZga7bHM34hthkMcrdfmqEwfsNgSxkHBTJqBN/a46hREgUc5my5oe5gNrP/t+ZIv1vQ45l3I3KOb+osa67CXvwHXEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395303; c=relaxed/simple;
	bh=pBCELV1emGyTdHUUECzmmuBjT1BLgOKgPI0z0ymr6gk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=emimy2SLM23OY22YCDtfBWwBhjOz66qFYg25mAVZE+OM9H1nU/AL0guZIC6VuwSXy7f7UpxkjbkepzqtnrSJr1Lq0TLk+ZlpDeG5qo4oP8GubtVgInlKw05KQN6Gh/+0sz2UyQB4kDws6ThHE2KA+HPKUBNsjwbwWvfW8lMoveY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ny+7Hlct; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-664916e5b40so34007597b3.1
        for <linux-next@vger.kernel.org>; Fri, 19 Jul 2024 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721395301; x=1722000101; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BO/f/Vk8BV7M1BnnRk7syCEofzWPotH46dIzExxE5KM=;
        b=Ny+7HlctailgVYhXJ6vbaBr3dw0ZsczYJgvBPLuXzCgy/N/JQHa1dS/NRTkxR9g6Rq
         /lqFljwrXOFdY/jol4KWoNtSZYNhcBd8XnmtbMTWbetbU8MOqx6OfaZXdlfiBti/P+it
         622H62/n6jFWN711+uSS5yO2QJ3OFeJrM9GDvh18F9katwoqNNL4q+Iw/YrNNQtCuVut
         NENPHyvxo9B2ZZO2Ww7fMvSXmjQvijD9O35UB01qxIj7u/mMNIDX65eHWI+ZN4D2D9Fp
         8JEM+K/aetjgQVZE73VwNcLmU1Fms17suWKXMrXj+luCqRtUcjLTugNXfYbP8T2/yeXj
         R/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721395301; x=1722000101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BO/f/Vk8BV7M1BnnRk7syCEofzWPotH46dIzExxE5KM=;
        b=sMjnO0x2b9yE1/XH5vwm9hpU4vKG+PTOF+zXqXXzrVSjCzvlkkIRA0zrWiTScOZFpc
         xCv3w9NNaLTO0iUHdE3zM4y5ytDHDt6iuyTRJoXRQDH1qsURzQVHWwyfdoOPm5HiQAFj
         zjyuDuF7ZjKiDkXZ34DJe1d9sA7S/H9S23zgXSWFbei8/UrkPxfyeNvGJGtpdUiuUIRj
         64T1ZQpqcAWbem0gUH2ge/rm+LCdxykp1YKgGbW6jLE3ts5eZHk9Uwg9gk+X4s8u8ZWc
         WQdqoycZE5UomcF3sIcH2cTGUSg443pE84aZsJijQJReaqVp1mRvU9S5qBlqe27dn65d
         w5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZyFf3KiNLXavtwG5a7Nd5bJ0zRHl57Z+4QMyIcXm6n8Xjq688H/Ge3aHCV7yBRIvjQrbYF+35WpgipKO6qw+bsajjz12etok+WA==
X-Gm-Message-State: AOJu0Yz9BciZSAHIW1ctGY9VelvQ8t3CL+vE3RXsviy16UrHEIKScLar
	4XcD+r8JY3XWK9E887xgBayToNMUEHikkeXEUMXSp4DfwHIzc1kLlUNYrq3PpZKDnPGrB4v+nAw
	UDw==
X-Google-Smtp-Source: AGHT+IEPtqovB6+nL+dEpY3lKDt9cE/kxszu/7IvqhKdMhwuBfYDyqi39g8sSH2tXQipBPBpmTlSJHz4wXE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:188f:b0:dfd:da3f:ad1c with SMTP id
 3f1490d57ef6-e05ff517e74mr278214276.4.1721395301549; Fri, 19 Jul 2024
 06:21:41 -0700 (PDT)
Date: Fri, 19 Jul 2024 06:21:40 -0700
In-Reply-To: <20240719134446.440ad28c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240719134446.440ad28c@canb.auug.org.au>
Message-ID: <ZppoPjq1HX0xnR1s@google.com>
Subject: Re: linux-next: duplicate patches in the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 19, 2024, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the kvm-fixes tree as different commits
> (but the same patches):
> 
>   2a2cc315c0ab ("KVM: x86: Introduce kvm_x86_call() to simplify static calls of kvm_x86_ops")
>   b528de209c85 ("KVM: x86/pmu: Add kvm_pmu_call() to simplify static calls of kvm_pmu_ops")

Resolved, thanks for the heads up!

