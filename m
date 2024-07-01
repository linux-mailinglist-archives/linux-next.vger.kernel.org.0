Return-Path: <linux-next+bounces-2777-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB0991E95E
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 22:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DCA81C221A1
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 20:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9F1171657;
	Mon,  1 Jul 2024 20:15:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9693E17164F;
	Mon,  1 Jul 2024 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719864935; cv=none; b=m8zh8ODDatZ1BDxfX8k7rj7fSku+rc4zXYFRq+ClqUODbg6yHDZRwk8TokXb4UuR9yH/BvhyDXaZHHXaFcUoCc9x86L0iwo8fJr7bWopMlbGn5U8QqvV0b+34/wv1JGdiGV0Dw/AJkgeAAJ0uA0t9bahHCrPrD7ZIvSis3NFiuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719864935; c=relaxed/simple;
	bh=haqSuc43ZKdTwzxqszlkPJZAfarR2WcjeVlMCGPNx8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbVWLXjQL/FUxtGnz0JOI7GnRVKs9gK6akhCPmB7hKzXX2ry3mjbS9VCsny8AnE3hiqFZRIE2UmqM1lSTU6suK7IiCpnMc5hrrVGlzJW6Hx42FpAcGKmlUGnUSxm0j+Lqw0fX83WWYDQkEQjCy4Oa2zwg+vZyeFPG08OUOnHnM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-71884eda768so1838645a12.1;
        Mon, 01 Jul 2024 13:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719864934; x=1720469734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j+Tz+4CGQkLaX4HpFSIaU27Nh4EjelF5DvTJp9jbsY=;
        b=WsAasg4bgpvxiC3hj5hBnjWqxWvxX3kC87YcDUz+FhXUhlT2oORysieSg5wVbjuZR2
         f8980jQizBQUujSdmcYhOw+6LJqT90SPiNHgWNsFwjFdMs+OR4lHTR+DHBk6LcKdPLdx
         PkwISsO1tfs6xJkGT3G65Tc/g6MKu0E3RTEq19AO22qTZ58/5dz38XGh/3cAveR/v7yF
         MCOVP7UWlKI8i6ej3noEtNe2AyjkNO9tWePYnjm21lxFnumVOoHC/DWcizat5jsHkJ7G
         JSQwZytF586rDLFKX9ubgJ3I4fOlip6uhh1uFkOHmiz2LAUX3bOu2o/rPIEkeCn1uvrq
         La8w==
X-Forwarded-Encrypted: i=1; AJvYcCVBecW9cGZmBULlXZiKPV0fgxH/cHlV6odriboSmiT20Kpv/0JVza2Q4aN+QAKK/hulxneBoV+G7SMbJ5tj/So8V05AVc90WTJSfkLHc2SzDKxNhCBAy7Mqf4AXTWJbQ7HJn5jsUCgh/Q==
X-Gm-Message-State: AOJu0YxZ564npeSC/ydf6q5OyUDUm39In1NJhjQwu2/3hUBAq/tKxOg+
	wYFB3j3u2eQbhF8u1gaCwXVNywugnmrFQ5pDBVcEiNQ/e4mPrQng66YWSmjm
X-Google-Smtp-Source: AGHT+IEtrKjZ3bZr9WjpmBmSxq9gYazDR6r4WkvVTKp8WcAgkYXExVA2nDrltOsjKG5hlCR9snjkSw==
X-Received: by 2002:a05:6a20:c91b:b0:1be:f090:7cd4 with SMTP id adf61e73a8af0-1bef6217150mr3626833637.61.1719864933849;
        Mon, 01 Jul 2024 13:15:33 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a95402sm6954558b3a.198.2024.07.01.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:15:33 -0700 (PDT)
Date: Tue, 2 Jul 2024 05:15:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20240701201532.GA272504@rocinante>
References: <20240701192453.3e4a0a3e@canb.auug.org.au>
 <20240701193748.GA13881@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701193748.GA13881@bhelgaas>

Hello,

[...]
> > After merging the pci tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > Documentation/driver-api/pci/pci:10: drivers/pci/devres.c:556: WARNING: Inline emphasis start-string without end-string.
> > 
> > Introduced by commit
> > 
> >   06fa2e1e9116 ("PCI: Deprecate pcim_iomap_table(), pcim_iomap_regions_request_all()")
> 
> I fixed by changing * to \* here:
> 
>   * void __iomem \*mappy = pcim_iomap(pdev, bar, length);

I wonder if the following hack would work too:

  void __iomem * mappy = pcim_iomap(pdev, bar, length);

Separate the asterisks from the name, so that the parser will no longer try
to make "mappy" bold.

Also, "mappy"... Philipp, this is so amazingly cringe. :)

    Krzysztof

