Return-Path: <linux-next+bounces-4584-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B89B956C
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 17:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD8181C21FCF
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 16:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773431798F;
	Fri,  1 Nov 2024 16:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3LJ3da5+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6D139E
	for <linux-next@vger.kernel.org>; Fri,  1 Nov 2024 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730478670; cv=none; b=s9B5nOu+3yN0l1+hiBetjJHjzrJ7xGCVpbBG0kp2/8ZcubGazdyLmGOpQvKe2zLTvm59P+iXmkI6wgI/GxKU93qmNCx+YABcnnVbesmZAUMFYWqj1GXx8vQ2LxEI0QHVqJYzXJboIxi1ilCd0QMIJ1rf77hftwH9chDqllg6Cmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730478670; c=relaxed/simple;
	bh=aCYFBS0OlRXeeN66mv6hk1AzePNNwIISd3kE5LOhZGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IF6/XRgnef5V8HICXxT4j6cOo7Ju03ftdAv1afW8m3hqU+giJrUGdyT44IJ2dFsHtVLUhnrQSFFQwyj9luNr85/aPqLGUbqOAkEswxUtY3ARvVDX/09n2xHx6UH9XcYqdYRBxTGKq7OlrB0ueIVqXjWZC8wQXKBjBxwamc7P7jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3LJ3da5+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea527764c3so47585767b3.0
        for <linux-next@vger.kernel.org>; Fri, 01 Nov 2024 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730478667; x=1731083467; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUMHVY5Pc5ujaPIETtg1OV7OoMZH/DlrlEhMasUvFWg=;
        b=3LJ3da5+VnMSMaOJVtGnkKbXVzQSvLW4o0hHbA7OILbUweL6kiiES6TLw56gaunJ6Q
         6Z1nyKTyIp06u+BlLB3ykq8nfFeffsPGNOl0rAZ8fCxaCYxkBrvTbxWL+GfgBaZajHYo
         wjA1vXy3w8qMgvr7/fBmUiiKM7nTh2xqdYMsMHkw1o1Z2+D7bOnyySPtGN1qfxUWFyyZ
         6DTOv5G+cYcIyCDs4+ij8iRQRFIE7lLtrBeD7UFfkJSKNUGvZ3YhAgM3oVPLWkQW4Hrr
         5rern56Tas03NIu0YpGpDDLacjUyfhCoIE06Z05fGwNJAnLOQXYZzKJmk+D2ZiT6FGKk
         zl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730478667; x=1731083467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUMHVY5Pc5ujaPIETtg1OV7OoMZH/DlrlEhMasUvFWg=;
        b=n0HymJZjptqbqWaD+OSAqP48yKewlBA2pESegeozoTkg9Pnxc0dr/TiKDgdzp8zhcD
         e1FJ4xAK3vWBjaaRbTN3Smzs6RQ8Tcl7iMuIokzojeUnOnSGqrmwjLC2OYW8PqOgowUb
         yEja73mXF9HHbV+B+ClcGZO9cGvfuxdm9WrS6HwbU+Gl68Vb9bmprrKsWUaXKiMwfFzf
         mYShOm5xY6nWNXZ6VGhGkNfb593pLtFVWcDstrRwbzXHMDNMsqvPr0cEIapWjNPJCWD8
         8kNfbzgowUhrvQfWr2a6srTA74ivD7KKTlVl7kqsKmEHYDOPLG8nKcMiPlnzWSkusCgd
         bQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCWVWY2OBvMG8rbir5fG6hBgGu3tJrsUhUEoKQBr2FEI5iXl1ao3wFg5p9eUsn3fXwcSrWSTmYChghNy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+mSdqGDGF68DdmeUb84sy6yjyqpvNj5d3aJwfk5sl+o7o+Szk
	sMwwfrLUcrsJRKiEyEOfaw8IG5hrbNkURcm8XafZmPQJ9F3kyrH90yzQLGZxJnay4CjJq+p4vnu
	VyA==
X-Google-Smtp-Source: AGHT+IHjSky3TikiN5BvrlqT+n0lNdXJaonGgodvNxJp+r7LiGTo8fiUiA/fuWajhuo5hdeSs5DxJ2eOWac=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:c8c6:0:b0:e33:111b:c6a4 with SMTP id
 3f1490d57ef6-e33111bc836mr1008276.1.1730478667415; Fri, 01 Nov 2024 09:31:07
 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:31:05 -0700
In-Reply-To: <ZyUARgGV4G6DOrRL@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev> <ZyT61FF0-g8gKZfc@google.com>
 <ZyT9rSnLcDWkWoL_@linux.dev> <ZyT-6iCNlA1VSAV3@google.com> <ZyUARgGV4G6DOrRL@linux.dev>
Message-ID: <ZyUCSZEv4w1yXwEb@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 01, 2024, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 09:16:42AM -0700, Sean Christopherson wrote:
> > One thing I'll add to my workflow would be to do a local merge (and smoke test)
> > of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
> > this cycle where such a sanity check would have saved me and others a bit of pain.
> 
> Eh, shit happens, that's what -next is for :)

Heh, but I also don't actually test -next, which was another snafu (not my fault
this time!) from this cycle[*].  Testing 6.12-next prior to the merge window
wouldn't have made that any less painful to bisect, but I think it would at least
have allowed me to detect that the issue specifically came in from linux-next,
and the bug report would have gotten to PeterZ almost two months earlier.

https://lore.kernel.org/all/ZwdA0sbA2tJA3IKh@google.com

