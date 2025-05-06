Return-Path: <linux-next+bounces-6556-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105AAAD105
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 00:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB9524E5ADB
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 22:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4269221ABA3;
	Tue,  6 May 2025 22:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C6bnK5U7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32AF21A440
	for <linux-next@vger.kernel.org>; Tue,  6 May 2025 22:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746570894; cv=none; b=mDeq1AQ09Yf1YJRkyVpEskacI1yR3P0tLuN+kiLDqIOAZY7XYveVOO/RIoMbe2P8RJiPjiHDxU3qJaxQqfA5dnxQoNewqRu+C4gyYHjjRdEoKXT4GvdeWXq91Bn2YPuXuMbQZM0/TsZX66HhiAro9q4VIK2p4abUAABRPZZf6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746570894; c=relaxed/simple;
	bh=kQJwoQkOOuUv9ewP2W8k5Y7LcX3ISM2sAo09WLHBGYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ecQpRKupRHMpR3BX9DZrSz3Hs5MLaWNwl080G599tDUFIfp/sbz+0mM8QkPJrndnouCWjXS2bR6ul9Zp//UEdgOT5lZqL8y5NZMjR9QJd/gyAuE++812REE79ReFbaHpZs9zg0jl/lRITk9tQIyKqy7UlnMQ0G7iu9HTxx//J1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C6bnK5U7; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73bfc657aefso3955289b3a.1
        for <linux-next@vger.kernel.org>; Tue, 06 May 2025 15:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746570892; x=1747175692; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vSYeF3NvdsfaujuW6koguR2ufsUfIh05BdXXiJcHll4=;
        b=C6bnK5U7I060NWou7N0vVTvHrrBPV27nGNc/k280ABr3IS7BeyJPMV8oO31sGZ9mkb
         P2WJXTAzmhqf+zn15OjuNPBjIVJtNXarSwADx5I2EzbC1XiGm6YV5KsdylwW8ZNyX8Hg
         Y4cYp5bJyTdiPoiSJOSE4FeqNMGDWx0nHn/k2cB8jualg2aNdVVubEodZlbfbKzLQtLg
         fLn2kLoghQGKO8SvjsBMdp6/KYQUbUaljpBE1nnzUCeEv/SyRkbG06nwvN1/WQPcUe1o
         /Aa/vI8w2QkmHNW7ohzvD344RbnXelJXINU3QBdhrSvQhpm5r0V+karZJ6Kai6xt99HG
         eQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746570892; x=1747175692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSYeF3NvdsfaujuW6koguR2ufsUfIh05BdXXiJcHll4=;
        b=HHcS/Sm9BNlQTLENUeZdgzxlhnaFjjRaulLBAkvzSxBNuENuA4JtAT5IMwqnKYgPmY
         F2qg471mYpt9MxNRezawEF6Y5FgUsnsnno4J/5WQuRXlSJc/M2fumm4JKBr3pqhuJxeK
         iX+lFZF3CkHEBuNmp9SSgL7jPTIR+DfvK5fu5HfBk8zJcw334ZTqEtX357TAAYZmUlig
         7WIRxnWhRcbUoZfkaE4QfBffHU+A2h+v+qamjdoo36fR03s4Eb9BvAHKfzs5jdX6XjFk
         qCz7MFEr6hee0yfNkZM9SvqdwhnpJuvVER1akwhyYNWJiJv0xhjGWAdSgSvRcWzpsoXb
         VrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXviqWe06yp/ToHOjnsTCFirp3fqyZA0E5yMRy8roa5AiAYQsfBau/D+PrtvuAJ32+B/UrYM54deYkc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UcUVTlr/vEKbofYqd9fR4kal3NUTrLTWPiiNrwGwxGh9ViTx
	w59uVELVECeSe2IHW40jEqubNuKJOhL8aWTSK0UT6STLyQJfPXeQHBunIDSrtiQyrv5rRdia2Rx
	EJA==
X-Google-Smtp-Source: AGHT+IHn4f2mqRKz/trSSnJUgBjvOKZ49UfTsHv5NeriPC5wpnzjyKNCvg7VysLzLScesoUU2LC0MTxehRE=
X-Received: from pgch12.prod.google.com ([2002:a05:6a02:508c:b0:af2:54b0:c8d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f05:b0:1f5:a577:dd24
 with SMTP id adf61e73a8af0-2148bffee52mr1185974637.25.1746570892059; Tue, 06
 May 2025 15:34:52 -0700 (PDT)
Date: Tue, 6 May 2025 15:34:50 -0700
In-Reply-To: <20250507073027.72fe0914@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507073027.72fe0914@canb.auug.org.au>
Message-ID: <aBqOiq9frzCAkNm_@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 07, 2025, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   3813825ea6d5 ("tmp")
> 
> is missing a Signed-off-by from its author and committer.
> 
> linux-next is not a development tree, it is an integration test tree.

My bad, I fat-fingered a push.  The bad commit is now gone.

