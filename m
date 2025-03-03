Return-Path: <linux-next+bounces-5630-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8867A4BB17
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 10:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1935A16F2CC
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 09:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B3A1F150A;
	Mon,  3 Mar 2025 09:46:09 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58221F12F4;
	Mon,  3 Mar 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740995169; cv=none; b=a4XWVjJehmQzajQn6FMdNFLxlJljdaE1eifimdOCf8wcfOf9SZr+wQPUcjB8Cz0p2aWK730AOJ0xuiKzzgZ2vMAegCZrreLp5E9E0TTEDz1/OyAer893aLnPXusRWXFuDN79Lplz5VSJZ/PGvM+CJdyGXj/Ee8su7a2cZjTW470=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740995169; c=relaxed/simple;
	bh=qRFySgLxKhY09jGIh6AHVnc/LV4R144Fqvz+okmsay8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQCgj3NiO/W2poFh14ocO2l4BsDfQBrNYG3P5MEoIM5MegKR8ouMyO725u/bpisTgWhhu7CaQbcnyKPto/+3Ar+jPzTgtJw0wpJjUnkGtVMLFrAGkv3C1NPKljUqRyi9OWvss+kdyaMBqqDF4XQAjGJ24Fw0LS47F1X+jtUlTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fe82414cf7so8224442a91.0;
        Mon, 03 Mar 2025 01:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740995167; x=1741599967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xerpIyc82MG6KvHsqBUiiJzLJy4hP6RzDKtr/CeFuq4=;
        b=Ai9RgHowmYjpg07TnhN9dhLhj26L9EMSU2D7qdW6mnemz5Ieb55HL/+C9cKZNvsL2e
         nSwQpASolQ89BMIKlZdvvww6/xkmlGTdxLQm5XG7NhqoFDv/LxMdeOvz/TmiD2OwwjWm
         /EhVRQxekA49jN2v7fmxse5Ka8wLLg6WO+XuDswuUkAskur0xlAO6jUF4VWLkh2frv9q
         nwlEIOMpUbzabjoeNZJDR60KyaFgzcpz2DwrZGcNqP6rc8tpzazaVd5X3V68sGUj8v6o
         jmWmLJ2cC8UPCDsdQlUVTQu9q5RV8fhgSHC5xYU8g04T61x828EU0VIrZ0R05bRMSqwd
         Ppbg==
X-Forwarded-Encrypted: i=1; AJvYcCWQgYEJdVb0XBnXWgTDb1KB0vlex8Fewae1VWicyg0Z7MYgehtjqP6KWHmiMfnyt4t4G1wScVR1YhCZ70s=@vger.kernel.org, AJvYcCX0mjBnrW6rQt9BFekqFUpUkt6uttRyreflN5F90faKAvcR4RtozMIfqPXZCD1Bp3Q76lk7VkCl3IbZJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqqtlj6+XSwrZZC6BzDiK4b+v//fNu2w+Dqhj1R6/kEg5q5YZ/
	B12czt4ntMTmv5ErxwIJRvc1Cc4sHyEEl+LYRAGJZRGTNZm6PGwo
X-Gm-Gg: ASbGnctCoi2MPryfca5wVKqd/eDU/3f87rB3J//N8wft0ISqyTKA3DCxZl61KoUCGNC
	cUoSEj+ca3T4+M/4sPDBhxpMYT1fct7S4oKf7kX8+a+jKjGrt9hAC+1/jPdT/RNy451nUPqor+5
	qjJVjI2lxSlg2H3CPTf70WgO1cZHehLSMWIWytDF6JBkLLzpPLDXXLTCjrNDZjwpT1Tk2stEZtS
	bUDxMfXKMo6MZMz6vSDZYZFNAPU2D8W2mRByr0lt12wyevR142RjrBw029V7nRuNkdjLcM5EEA9
	ES5wKcKud6NBH36InTs2zvhLnmJygaMRrsXVOvY5/dSnZBaPTgSMQYqdR661Y10hKVnX/RTBhPc
	iV2A=
X-Google-Smtp-Source: AGHT+IHELCHlJeL98RkfpUln7YkAY9rOB6Z387rUchChjvJfXfuMUBqbuPtRfO6CRAxTwwlwMlMU1Q==
X-Received: by 2002:a17:90b:2252:b0:2fa:ba3:5457 with SMTP id 98e67ed59e1d1-2febab78780mr22387538a91.17.1740995166995;
        Mon, 03 Mar 2025 01:46:06 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fe8283c9d2sm10587214a91.35.2025.03.03.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:46:06 -0800 (PST)
Date: Mon, 3 Mar 2025 18:46:04 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shradha Todi <shradha.t@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20250303094604.GA1065658@rocinante>
References: <20250303182639.5e920622@canb.auug.org.au>
 <20250303075002.GB138071@rocinante>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303075002.GB138071@rocinante>

> > After merging the pci tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > Documentation/ABI/testing/debugfs-dwc-pcie:15: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> > 
> > Introduced by commit
> > 
> >   8562ae832769 ("PCI: dwc: Add debugfs based Error Injection support for DWC")
> 
> Thank you Stephen!  Having a look...

Fixed and pushed updates to our branch.  Will update our next in due
course.  Thank you!

	Krzysztof

