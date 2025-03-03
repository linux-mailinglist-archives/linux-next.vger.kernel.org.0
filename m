Return-Path: <linux-next+bounces-5627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE4AA4B888
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 08:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59053AB95B
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 07:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA551E9B16;
	Mon,  3 Mar 2025 07:50:06 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED71E5713;
	Mon,  3 Mar 2025 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740988206; cv=none; b=NQdF67SYVg/047sdFxvaOi2c5ZYKJcPDiWiq79n/AGzNLRQoT7gqkS3ZiZ23kSDmC19zuqiv4uw+PJwnpgED0sXh6L/b3LUPnFGScnRe94MRJRsbqLzTN4vQjGqoHLxBbwqSe2sGjidtDpiV03AGia57tfeZpT+eOfZuAb0RgQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740988206; c=relaxed/simple;
	bh=PHvQTuL7WlK48QicwYC2zL1hlbusXj8ebxEw2mg//KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8JsF5UDzBFd4MsDyBChQO0ibtdHDrLFTFgKhYK47rROFiifhonZp3gc9CnGRsFrJF4Wlpipyq+IS69INXdK7H3o1rhnUQVhn3oP0p3LOlFNv4+A3WR12194YZ7wM3z2BPVOpNYuW51X6fVtHhHdI1PL6STBo93eYBTaPMxr1YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22398e09e39so18066555ad.3;
        Sun, 02 Mar 2025 23:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740988204; x=1741593004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8X/no4ewdXzGZG9NnQTZhg3V78zJlwB9UDaLdKydSY=;
        b=VRZzNXKGrLLF/t7Opg35oKg+ZDbknKZtLFAkbFOi+VdQl7vUD8z62mBAWpSktunBDE
         6sUB5DpcqNLvF3RN3FFXv1bq82QrGpfUyBiGTCM0W92S0rL/wdxclLuCYUCkwbR5jIS+
         Un68lSMTiErxpH54UNZ2vJ/M4AyJG7vfGp8X5NmDZwfVSkDB21we3cA57ziKlnMVf/u5
         o75dhL8zFrk5j2j1xWsMHoD4y2R+7+tWStrnjXLhvNu3gQqvtlD1eKeDii2JEUOdBOKQ
         3Cw3Pu7rqzo9degxLFylliswKNUefPpvlUT7P0Hp+U/1/OfuvrZEtw1t1O2eVpSF+LpF
         C4zA==
X-Forwarded-Encrypted: i=1; AJvYcCU/0S6JD1hBwo8yNJ3jT/Io6kEdlT52BHUaBl2gDkpOiQLxfNB6RFl5cINQoehUaaXC6vxJWP+792VVZ4k=@vger.kernel.org, AJvYcCXlYu2oyHz44wXJHqr4LglD/vdqSdt+9vOoaM7NkIk8fqIf/ZxUeFsZqqRqooL1dmnq6OdOPKecQovLew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDPLXuVJ3K/TiuT56e2b29y42E1b19ksqZ1j7U32M8oE1a0LKr
	Q0m0La5HNpnQTS83PfQAXvGaVjxlRWyM4e37cND7SRYi+ojScxfN
X-Gm-Gg: ASbGncs2hYwa7wqm+o6fS4u/nNZDE/s71FrLyk+6/IuwS330lfGyidQc6FFbC3BAI9u
	jO3rd5ojuOKRU4aS2FN71kBeIKAT86Owsn6cuKYVTo6AFqXIsJfx2JetaOvFozsuVJuuuehHjrv
	HBrdZciTuRnZiTr8vvVgrP+j6v31atOymvt38ZELLXaTqs34zBJnrHgQQefCE2ZgFWYw2Qrokhy
	cOOcnewcthQ9rGVAnCGhVxmo5bqxm4HxQVIULjHJ/8kr3jGofDklfHjohL+Jw1js/JUwTP5ZQ3C
	+7w5clqHE8LPN4TptRZJ/2Q+PJHd1rw0yQxXsa9CnBo7bZ7NHCY2zAnGEYTQOnuroB7zRtzorKQ
	NNRg=
X-Google-Smtp-Source: AGHT+IGVW/3cIvFOXVvM2dFl5lampVJ3DfPjV4gjT3gvoXIpHCPvnlwq4UFdJ36VVS+609wgG4amzQ==
X-Received: by 2002:a17:903:2307:b0:220:df73:b639 with SMTP id d9443c01a7336-2236924e723mr190619935ad.36.1740988203821;
        Sun, 02 Mar 2025 23:50:03 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-734a0024c81sm8171297b3a.118.2025.03.02.23.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:50:03 -0800 (PST)
Date: Mon, 3 Mar 2025 16:50:02 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shradha Todi <shradha.t@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20250303075002.GB138071@rocinante>
References: <20250303182639.5e920622@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303182639.5e920622@canb.auug.org.au>

Hello,

> After merging the pci tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/ABI/testing/debugfs-dwc-pcie:15: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Introduced by commit
> 
>   8562ae832769 ("PCI: dwc: Add debugfs based Error Injection support for DWC")

Thank you Stephen!  Having a look...

	Krzysztof

