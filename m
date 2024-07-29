Return-Path: <linux-next+bounces-3154-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F09401C7
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 01:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD6A2282B38
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 23:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A713F18FC87;
	Mon, 29 Jul 2024 23:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dJhWFbY5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E218FC6C
	for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722296360; cv=none; b=qNEIk5NugKQ/SVZyCU3plvB+MgMffD8OIIVVh29t9GseJjHw34OFMIDXVuspgfRdOuWrXgTD89b6oRLV0jL7jQ7k8yvht98yzhZg14zpb2y9RIva7UXNleDwZ++V9NscOsdyYs8lPbJfN+Y31uBbGr0pPZ8wT7PFFkpEhE/8MmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722296360; c=relaxed/simple;
	bh=GrYTdr/Lfiqp/j7QTBHta1asRCW10VHT87ZR2/J9QpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKLkXf3E7cqL2lUcSxnComRfdhwNX8aV0oCIYXrvJCgeEAppVBLSffJjR4zNZthCKrxE6fyUyY6WyxQkQNhJjGq6Rf2PqmBA0x0ChJgf7MXl9mL00Im8izqWNo3t2b3FkO66P9+2VBvh8yt554XMuPjTiQUhKfvWDwheTmd/lBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dJhWFbY5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f008aa351so6017140e87.0
        for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722296356; x=1722901156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QI6LketRcSHxADi+8iYULTPVBmFAZZrmM/uumYTfQCg=;
        b=dJhWFbY5iNMRTwDGv4td93A6EQHvrWt9Y1rrT94YARifaRz/w6/sXUGnUNnpgaez7m
         PXIQOlhxrLp2fET1aitnpwmlFbE4ka7sonA6iLlHMpKTbDi3qErHsdRg+F+y9Ai20zEd
         D5xozPFVmhn+Rc4TcvfmYdD9zil9GkEZ7fM1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722296356; x=1722901156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QI6LketRcSHxADi+8iYULTPVBmFAZZrmM/uumYTfQCg=;
        b=p0BxMSJqXyQ3K2tk392EuSxqgQrLgAPONUwEobJHOBq9C7B2fxh5uZ+QwIzvpi3qaX
         WNfJ+jypKdSbpVXjgigYwkBzVlorpvvyiAddAevREJicIsIDnuxjxSsZs3X2adT3YSQV
         ysbDPFz9p+2LBHZOE+a6m6+gGLnG20Nr92cVEdItZz6Q8XyH49afiP/2FdPqdr9mQQXe
         Th4p4+KGFp9TtRiQX6d4aggldf4yXE2lOBlKmZj/VabeQlyNuHFUXSOOMpheBA5FZONA
         AswBqSemZKoEIaDmzNqPJDoeHrnHe7MScAUCOzrdW906enkCAn6BN1xV9DKr/njiZntG
         iMVA==
X-Forwarded-Encrypted: i=1; AJvYcCVSvVepQ/MLwVK68IHMzRetISVibLcSk41Gzk9GhhbbSUQLTq37CPcNBSB++GHpDJMrnm57QSlho5tSfVwgQ97dt+U8FjO69wI5oQ==
X-Gm-Message-State: AOJu0YzO6P/U1TlnmeteIXpPPZTuwpAfLj0bLADcphbXt1ijwYTo5Eai
	eBzeEsaPvc0WlVRNAYOjSNQZdXwVVeaDskWwdLQBNRZa0D9rZF1pGQ1CbbhGBUPAPEgFUYw/8M0
	EQaf6Fw==
X-Google-Smtp-Source: AGHT+IGu/IZ/Gwx+LKbfo0oDWSTCA2Kp9dIH+xfcxH982BSiJQpjuAA97jJ/sg1F0EI+JAKzQ2aLDg==
X-Received: by 2002:a19:691a:0:b0:52c:dba6:b4cb with SMTP id 2adb3069b0e04-5309b26b81dmr5482879e87.13.1722296356171;
        Mon, 29 Jul 2024 16:39:16 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad90fe2sm566881366b.156.2024.07.29.16.39.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 16:39:15 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so6469551a12.0
        for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 16:39:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoLZDl5mqI0tA5HwBiLWpWM5G5LGpiFPAdqGiyUmcQUXDc8E0x5SkyBWF/ezHqGhB1tv7nY8+l5PMeSxNXKBYzA4sGFU2KmJqAZg==
X-Received: by 2002:a50:d696:0:b0:5a2:2ecc:2f0 with SMTP id
 4fb4d7f45d1cf-5b02000bde0mr6124611a12.1.1722296355229; Mon, 29 Jul 2024
 16:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730082204.57c64765@canb.auug.org.au>
In-Reply-To: <20240730082204.57c64765@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jul 2024 16:38:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgEipN1BoDCG02m1XqvACCFLxj2SoEG8O4BZMAFXKifqg@mail.gmail.com>
Message-ID: <CAHk-=wgEipN1BoDCG02m1XqvACCFLxj2SoEG8O4BZMAFXKifqg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the origin tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 15:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the origin tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:

My bad.

I wonder how I don't see them. I very much tested a config with both
SMP and PROC_FS, and those obviously correct warnings do not show up
for me on either arm64 or x86-64.

Does anybody have a clue-bat: what makes only the powerpc build show
this valid warning?

            Linus

