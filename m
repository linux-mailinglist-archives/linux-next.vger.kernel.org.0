Return-Path: <linux-next+bounces-9212-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0258C8590E
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 15:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAA783B4C0E
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 14:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1979213AD05;
	Tue, 25 Nov 2025 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rdHPlceK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7484531618F
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082187; cv=none; b=M29kgdHCMax9t061fgK08+VojhqaqSv0ylwZoXROoIo132djTZMDGeyTr3vRu7Rnl5sgL97ovXI23BCL2KqRFJ+kpQje7WiazQ0f3sobYxgKQzS3FyPQHRBU0F8z0MDxclIcTE/RMxxs96STr4JrDLF+Ajp25T6azQ7qBsmbKmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082187; c=relaxed/simple;
	bh=4cKCw86HvohPctVdf2BgZC5nU2ans+hmUsT2tp/yN5g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c+SulZMbMD0bA+9JlAN1gzx/I+gmfzlAVWJB31M+rOd+l/W+LDaWiCZItlbadWwtNwwooYDTy2QFQIVwpgRK5TWEjdUilSFOeMSnZRZRHa0DawLKr/xsf1bLRfppsDhXb1ToDXOlDdTZhmHdw7JooJV3sDd9h8w8c8+sypqGKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rdHPlceK; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-297dabf9fd0so73317025ad.0
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 06:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764082185; x=1764686985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5d8EZM5rG9KUo3VoUZ6ZoE8IgaZKmyi6+M8TDpzTPTs=;
        b=rdHPlceKuO9d4isSLkcviLe6+84uWutAQdZjDOYA0XZK+PNR1CzqJza/1s3MtjH7gZ
         txQtmuv7QuFIECNqmUpcJvtVqoMYEwf9k+JwH6Z1vGjhJQeUpFHEaZum33KBb6Dpk3ns
         6iVaku20FY5+cuVkm12j36QYl/+2I0ZLZQXJPW6XStoeM56QckPdNj5b/GHwuyMHaRWP
         Zdl8pd8xoqJxQT8SggU7b4LS+I/vFPiqR0owzX3km0iqu3hq7zt655HKb1TPyRyBntCd
         4XHJHKcpU2++FOV9uEXFwmra29Nb9VO8mNeMMYje6oR4WCVLq9sKhjnjlRJkT6ddMYue
         SV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764082185; x=1764686985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5d8EZM5rG9KUo3VoUZ6ZoE8IgaZKmyi6+M8TDpzTPTs=;
        b=lkQPqlSjOZwprhwtDwGmUA2Ovea30BTFRjbFsUuHd11GEFuzeSEYf+QMqFjL38cCOC
         U2RZS//lpUbZHxPLTmgbeGUtbnn2FslgFdZhzv4CVdSrrq9AhDBwPU+uSO+r8CecdxRD
         JklGrJqeB+sgZ5j1rD1Lpc5kiI4N/ZszWy0efZt8Rqdx3dUG87JU10OqebsNWGWgpqJy
         P+bd8sgU+491n2hn56gEYrjtx0TyU3ORK5wseYlpMDuoMPWXQlM/cqujdgAcFQ3MZE2s
         cplWa6C12FllB2oRzLrQr4j5XAYYQOll8vfLC0/qqDt+zgNpfDDjRrmvV2a/wd3wanzg
         ldiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXox+AtTfwWzU6naluZ7BcgMMtvxwS0L5/k6cCD9gPrtXwC45fvtubnv95cflVrNrICvB6cW3A8R7OZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWkLLwc04dOwUloMbg484hbOyAls+9F9YKQgGuJlq3l71WDsnX
	W0bAy3UmM75pvt7YzFE6A24Rq0vuNQxzGLmkrR2F6n7++lb1afEJ2p4z5oeZcMJLMrwSEkhB6FB
	U4lMQIQ==
X-Google-Smtp-Source: AGHT+IGKL7OwOq/Auaxg4ELc22EOqh6jc4Wk9xeVwMsdPSWOOn22goFtIg3JOHPdLnbP2LC9QCTznluKS6s=
X-Received: from plhw14.prod.google.com ([2002:a17:903:2f4e:b0:290:a36a:bf99])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a06:b0:297:db6a:a82f
 with SMTP id d9443c01a7336-29b6c5088ccmr194114095ad.24.1764082184827; Tue, 25
 Nov 2025 06:49:44 -0800 (PST)
Date: Tue, 25 Nov 2025 06:49:43 -0800
In-Reply-To: <20251125155455.31c53cf9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125155455.31c53cf9@canb.auug.org.au>
Message-ID: <aSXCB0yi_budofvA@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the vfs-brauner tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Ackerley Tng <ackerleytng@google.com>, 
	Fuad Tabba <tabba@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Shivank Garg <shivankg@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 25, 2025, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>   virt/kvm/guest_memfd.c
> 
> between commit:
> 
>   ca3f437d9769 ("kvm: convert kvm_arch_supports_gmem_init_shared() to FD_PREPARE()")
> 
> from the vfs-brauner tree and commits:
> 
>   497b1dfbcacf ("KVM: guest_memfd: Rename "struct kvm_gmem" to "struct gmem_file"")
>   a63ca4236e67 ("KVM: guest_memfd: Use guest mem inodes instead of anonymous inodes")
>   e66438bb81c4 ("KVM: guest_memfd: Add gmem_inode.flags field instead of using i_private")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (I just used the latter version as the conflict is a bit
> difficult) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
> 
> If somone can provide a better resolution, that would be nice.

Christian, please drop your KVM changes from and send "standalone" KVM-only patches
after the FD_{ADD,PREPARE}() infrastructure has landed.

Shoving things like that into -next just before the merge window, without having
been Cc'd to the relevant maintainers or even kvm@, without changelogs, and on a
short week for many of us, is not acceptable.

