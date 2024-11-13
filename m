Return-Path: <linux-next+bounces-4775-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CAB9C71BC
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 14:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305C72848F9
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 13:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9353B1FF7A4;
	Wed, 13 Nov 2024 13:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ofd69MPg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9752022CA
	for <linux-next@vger.kernel.org>; Wed, 13 Nov 2024 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731506290; cv=none; b=OQwWOMlhfua9zA3CnNfXWDiJsBurgTS0cO8Kd3OARpjBQhvPAlkrwNqEyj2elWSPTJGW6CEddNSFaKedZ9x8cWi6nC9JCLZ0kfkeihJfZGywJFFq6kKBoNn50cMtWMAJL12+XRdn9GdGsd71WHtZcByLtusl8oqjXUploG1vdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731506290; c=relaxed/simple;
	bh=JZahVK6A6WHKFKpoo3TZaAZQr852dUJgztt9vEtkMuY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c4KxaFPDTF9bw7/rE3cTm/cmzPMI9GvssPtXg823+p7cjDlW6wCcmBxx0ixTp5m7bUmLYdkp2u78505swd4RbwcfgRhbZ9FkVE0YD269iMdUyY0APJjWF8bgb6N+wNpgh/1by5ChjyoWiDMdCj85+sBrIqdsA/2upsmklOh71D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ofd69MPg; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2e2c6a5fc86so6642529a91.2
        for <linux-next@vger.kernel.org>; Wed, 13 Nov 2024 05:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731506288; x=1732111088; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooEYI/UnRvsG1fCOLEZCFWu+Q4mDTiOeXH7s7O918kc=;
        b=Ofd69MPglxDKQRox5oqA6BiFcfonKIkM55PQIv7TgjDgNvf0awlAIGIq9sD+CBJxJu
         Vwew+8WJyvTZ0n9H1zBrz+oz/+lUESgUOmmMAZ7Aa81z2Ox+9iS9a+Q5dHTcIpjka5s1
         ignb+rRwMNupZ2DeXHK2TNYzLFpfOq3HZwa3x9FT/Sr3WE0I+vbvH3kaRhuuLXRJPdPq
         buThZQWrvGogMPJlK+A7Ydvo6cluoem4HftiKB0/qy0kKXOawBEn+NZqF2+NT1GLsiC6
         a6ISy99+Za4Tozfnqm0ioQ6mxpqGMRtAKnvVMAgt6GquKTS0STDc3U7DQKR7QXtR0lAE
         TgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731506288; x=1732111088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooEYI/UnRvsG1fCOLEZCFWu+Q4mDTiOeXH7s7O918kc=;
        b=qQA1P6JsKOBFerj6hTV5LMebxCKrWMOXUF1R9HVNVtqUXQ8DyQKth3lT3FGNxIskuC
         zOYC1sv8PM0FcG0e/D2VRfS5SJGu3CWDXP+ebbss82fOcxRrBPep8dGX8oxEmfBgeuwh
         7odDTDMqVbSCgC5DlGghOwpCnsZzw0802Q9Yr6AZcmkYJyp2dFr4ZVsoBKlEZYnGIDtW
         TK+swmB/9JM+8Hwu1Gtn81u19y/5O+eWhHyagsl2SfuswmSpgvZrzIFStM6CGKR5eBF1
         J84MeotS4ZBRzry9D0Qvye3a58R48UTt1/by66cbgmpQBz0Vcp6wJ8Uc+kSBshwWCu2p
         /oDw==
X-Forwarded-Encrypted: i=1; AJvYcCWkNK5iI6wNDqJ/vXhTya8JaUFT6lYSi0dJ4QNj+ESTWERXWEqMBnSjbgr3eAvILN/xZvW3zIJU0Ofl@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBbWllbaKf3+6PAXY+WZ2cASyslxmLHU3/YJ0A7ZZGL1cuOPh
	0EHlXO5u/5Az/uvr4c7iljziCdUghowovl3qPsDeekIw/ahwiCN+CI7xg2C6nBiQV6tOA1k80cJ
	qfw==
X-Google-Smtp-Source: AGHT+IEmPnp5IUczH+svioRwvPbagn/q42BMQ4u7qufOju086L/jLjTrk3EtMxS9zXMDyy0TQFnSGJo3Zek=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e149:b0:2d8:a37d:b762 with SMTP id
 98e67ed59e1d1-2e9b177a544mr88593a91.4.1731506288404; Wed, 13 Nov 2024
 05:58:08 -0800 (PST)
Date: Wed, 13 Nov 2024 05:58:07 -0800
In-Reply-To: <20241113172902.7ada7d6e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241028192945.2f1433fc@canb.auug.org.au> <20241113172902.7ada7d6e@canb.auug.org.au>
Message-ID: <ZzSwb6TQ9fXH37f7@google.com>
Subject: Re: linux-next: build warning after merge of the kvm tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 13, 2024, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 28 Oct 2024 19:29:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the kvm tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > Documentation/virt/kvm/locking.rst:157: ERROR: Malformed table.
> > 
> > +-------------------------------------------------------------------------+
> > | At the beginning::                                                      |
> > |                                                                         |
> > |       spte.W = 0                                                              |
> > |       spte.Accessed = 1                                                       |
> > +-------------------------------------+-----------------------------------+
> > | CPU 0:                              | CPU 1:                            |
> > +-------------------------------------+-----------------------------------+
> > | In mmu_spte_update()::              |                                   |
> > |                                     |                                   |
> > |  old_spte = *spte;                  |                                   |
> > |                                     |                                   |
> > |                                     |                                   |
> > |  /* 'if' condition is satisfied. */ |                                   |
> > |  if (old_spte.Accessed == 1 &&      |                                   |
> > |       old_spte.W == 0)              |                                   |
> > |     spte = new_spte;                |                                   |
> > +-------------------------------------+-----------------------------------+
> > |                                     | on fast page fault path::         |
> > |                                     |                                   |
> > |                                     |    spte.W = 1                     |
> > |                                     |                                   |
> > |                                     | memory write on the spte::        |
> > |                                     |                                   |
> > |                                     |    spte.Dirty = 1                 |
> > +-------------------------------------+-----------------------------------+
> > |  ::                                 |                                   |
> > |                                     |                                   |
> > |   else                              |                                   |
> > |     old_spte = xchg(spte, new_spte);|                                   |
> > |   if (old_spte.Accessed &&          |                                   |
> > |       !new_spte.Accessed)           |                                   |
> > |     flush = true;                   |                                   |
> > |   if (old_spte.Dirty &&             |                                   |
> > |       !new_spte.Dirty)              |                                   |
> > |     flush = true;                   |                                   |
> > |     OOPS!!!                         |                                   |
> > +-------------------------------------+-----------------------------------+
> > 
> > Introduced by commit
> > 
> >   5f6a3badbb74 ("KVM: x86/mmu: Mark page/folio accessed only when zapping leaf SPTEs")
> 
> I am still seeing this warning.

Paolo, can you grab the patch from Bagas?

https://lore.kernel.org/all/20241028125835.26714-1-bagasdotme@gmail.com

