Return-Path: <linux-next+bounces-1788-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82094897121
	for <lists+linux-next@lfdr.de>; Wed,  3 Apr 2024 15:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22A7D1F2AB14
	for <lists+linux-next@lfdr.de>; Wed,  3 Apr 2024 13:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F158414883B;
	Wed,  3 Apr 2024 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iSLD6e82"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765E6148847
	for <linux-next@vger.kernel.org>; Wed,  3 Apr 2024 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151033; cv=none; b=gnSUMOU+Hb5U4bEDEdvZItcQIkqoIX9jNQHstlSKTkWmdGcjSFnKYVuid/+RrL9mU5ifM5KUVPoZd0W739boIBHLZMmcRXzDNPaiHrk5sf3uoyxyEjukXQsFOH3b7tla7U3EcrkQjEgPuZD6K87l3imYPRrk/JVkET+CW8tiKdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151033; c=relaxed/simple;
	bh=bhTzMUc/tky1KdKOn6O2DzThVZpRWR68bl8DQ1qWalQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YL9N873GII+TM6c/PfYRFjUurInwBynH5jkTYKTFJDPABQ/YiuxfCZe7awQKUAveBjcdzxDcLJJrLXBqP42AXQ0rYAgEOqPSimpShIqwG0I783BBrBcK/y9KSAEgPf+21j2zMwSrP8OCLUyX0d36UP3TjZqqbx0KSH3f61lcipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iSLD6e82; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6ea95c30053so761814b3a.1
        for <linux-next@vger.kernel.org>; Wed, 03 Apr 2024 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712151032; x=1712755832; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=79QE4qLUqihK840Eis4twlw7XMMTo39qF0kCgSG1iyE=;
        b=iSLD6e82aZOWjmtk9GI640uE6FxCig3oPD12RmKRjNVRJ1K15H1OlVTHq0k6giiv21
         Zqz/rG5MtedaeFproZ4jJXrCgGgxG7OnqqL1aK1mzbWF6HBLX1Bf81hRWnUdIuvFdGG3
         7kc7yT6sLoMf0pMQWoG31Ofu1yiQhWgDzPzfrVWaRxDFL6S4gMLT0TUq6mMq4Bsjk777
         Y+RZ5v7+AD/YZmj9W132ZjLGAZQV/d3OX3dyzy7SejxZvC1DzHzjVitSgLCgBWpeQ5P8
         bktTfglh0QoYoeqPnWR0KL3o/JO0TliDzuDY2wjulf4RbYmw5mJ0gsLqckG7D5x49e80
         9wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151032; x=1712755832;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79QE4qLUqihK840Eis4twlw7XMMTo39qF0kCgSG1iyE=;
        b=UaYdC1kwzual9O6GT/dvzAhR4gbzTxU6+0SwNTe6aT7GZ5ZwFXjwjLswOuxqBgS2RG
         yjt+k5h26Uswmtz4pTIwg2ZNG/8LJqEAm2sKKIBIGntS4kXAJ3mITqdiy5ydbUsvvrbx
         x4t0i6d0dlnYPlP0A89MY2IdATeCTSwE7Gi9XUYBMabm/YGCCM0lHdWbe1D+DUShwYnu
         v4uQkcgDGMQ3P4ZyBLxPmUyJpUX+fy7vH9NB13efn1Bc/B7VJWp8YWtdEy046OwWP3CR
         YbxmlxYHfa4bzBIThcyDhGteP24cJGzkoPlTDkzwKAn9iy5QBfna3NKIghwUleZuQbsq
         8WTA==
X-Forwarded-Encrypted: i=1; AJvYcCVPyTNr1HLzIqwHn4XxAaIIaWPd4HruRHTXYSeLi4cLcVLZs6cR3CvAWdOU3dj4d71TCCwKIFVPJgtFjUsMm1NmZSf63meQ9ciwIA==
X-Gm-Message-State: AOJu0YyIW93xA6FIpnFEqhvCuSgoC/wVTqDznQ7pLrnohkMPMX7+83qV
	RIeev4uaLVnaSo5gHVRBCcvM8b42ASLbJ9xKU3Krjt9BRaAcnZ+jgvldwILn8aIjyhq9YTMro6p
	ivg==
X-Google-Smtp-Source: AGHT+IFod3/kQyn5StbNtoSP41TxlbYNGNG8rECKzsaR5g0EHm09eDExYuEmIMuRYPn11TddB0ykA7cG4O8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2da8:b0:6eb:1d5:a3a with SMTP id
 fb40-20020a056a002da800b006eb01d50a3amr134207pfb.1.1712151031793; Wed, 03 Apr
 2024 06:30:31 -0700 (PDT)
Date: Wed, 3 Apr 2024 06:30:30 -0700
In-Reply-To: <20240403115353.59c7b4f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240403115353.59c7b4f4@canb.auug.org.au>
Message-ID: <Zg1Z9qs108PoXeMm@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm-fixes tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 03, 2024, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
> 
>   tools/testing/selftests/kvm/include/x86_64/processor.h
> 
> between commit:
> 
>   0d1756482e66 ("Merge tag 'kvm-x86-pvunhalt-6.9' of https://github.com/kvm-x86/linux into HEAD")
> 
> from the kvm-fixes tree and commit:
> 
>   964d0c614c7f ("Merge branch 'hyperv'")
> 
> from the kvm-x86 tree.
> 
> I fixed it up (I used the former version)

Perfect, I'll drop my branch.  Thanks!

