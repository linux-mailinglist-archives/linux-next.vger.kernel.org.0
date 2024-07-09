Return-Path: <linux-next+bounces-2872-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E792B1F3
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFE341C22237
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F479148FEC;
	Tue,  9 Jul 2024 08:18:49 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8A712E1C4;
	Tue,  9 Jul 2024 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720513129; cv=none; b=fOm2eG8z7rzib21veN6+tcgQ1ebLD+bsfvoLMCnIfQrm3gpuK8l29B19ScLqnIrN3OBdkfCWbnpp3KuqzKVAZHZmRg+9Z0GCnKKnb7hyxST5iEZXJUhDlbLlBMe2bz2wr7rSZslPskNBU16sTwoq5dchaqRxgFWIqB2HIAUq7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720513129; c=relaxed/simple;
	bh=GLjoN43u6BL43gzHfZAxD1P+CdDDhdGm7Bj/z5i2x80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8SkYO48FmsJ54he2SNMU7SryqKJ4EqkkIZTBJatZF0Dznmp9KrDBqGw1AbWwQmdHj4N8reEFy+O7hAG1mlOKIwCwdwdnLSIaCa12nWSGSYLEPInKR9XXOD7vjbnAYM4RaOyq7e+CQK7lGjrn7v2Z3gsO/7pbpVkFsxDAiohnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fa2ea1c443so36363605ad.0;
        Tue, 09 Jul 2024 01:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720513127; x=1721117927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+4YWuk2eULLz9kdGrUhDrllF5AsObbzG9cT63SL70w=;
        b=lmBdVKe/KIyVFsgLwB2MdaLEvyuCqak7R0JPoX4D8lqweeWhGtHzJEbrtWUHcPO3hd
         Ptvo6F3mqf3Zhjmva5wbsCuLlEv9lMvyZOtk78Xb7qSm2cKiVMulbdeM7Cey0hx0I5Mw
         UtVD2M///KvKJwGukjZXW9Fg2IR3wmK0COls6Ap6pzoVBA1sS1R3oQi1QIhqlrtHADH+
         3vUrGOtiYJpW0j8qgExbDQrx0y1KORi/AqTmEXuoYqkERWhVKn5fbBBTCksYmoICKty4
         fi2Vo5vFDp41DnvK1GF8E4DImsmjGzYIugbx0x7WFRD4LlwQ0IjK+pLSJ1VL8UNL3iwI
         n9mg==
X-Forwarded-Encrypted: i=1; AJvYcCUMLkBVOFSVMUwU3bH0A6siUNnf/h52e9EHzEnbrlf+AZotFJQMZt5icT+qQp5b9ZKfV4qygyrqmdDar1yi3h0yUMwiUi4DF7Y6ZSX3+/VutSLw92rZsioANHgAjEcDgNDX6GEXCvcL9A==
X-Gm-Message-State: AOJu0YzdRGLFJtY86/wmA6MqIE4oz6o14EX0IatyrssUjLVAeBMRdC8T
	oy7I4DpMyqSIcve8DDzA3OJRHdCEbXiVU1ItRjxpSb6+4dKYXkuNb4bW2DjRC/Q=
X-Google-Smtp-Source: AGHT+IF/ZSS7+RxnIz0Pi07SHjIULG35YCO0HBoh1qH3+hi4q4SppN+p24ICDmnDu2X4p3EsKpj73A==
X-Received: by 2002:a17:902:cecc:b0:1fb:701b:7298 with SMTP id d9443c01a7336-1fbb6d2425fmr15152405ad.32.1720513126693;
        Tue, 09 Jul 2024 01:18:46 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a3ca56sm10586095ad.118.2024.07.09.01.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 01:18:46 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:18:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the iommu tree
Message-ID: <20240709081844.GA3611159@rocinante>
References: <20240709163305.188b1182@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709163305.188b1182@canb.auug.org.au>

Hello,

Thank you Stephen!

I am really sorry you have to keep telling us we have dt-bindings
duplicates so often.  I feel bad about this...

Please, be patient with us!  You rock!

> The following commit is also in the pci tree as a different commit
> (but the same patch):
> 
>   40929e8e5449 ("dt-bindings: PCI: generic: Add ats-supported property")
> 
> This is commit
> 
>   631b2e7318d4 ("dt-bindings: PCI: generic: Add ats-supported property")
> 
> in the pci tree.

I am happy to take it via the PCI tree.  Uless you want to keep it, Jörg?

	Krzysztof

