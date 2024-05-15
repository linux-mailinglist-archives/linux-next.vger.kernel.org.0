Return-Path: <linux-next+bounces-2318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF868C67C2
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 15:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2CCEB2293B
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 13:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE39A5C8E2;
	Wed, 15 May 2024 13:50:12 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F74813EFE4;
	Wed, 15 May 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781012; cv=none; b=XkWJSUPPOIbHc6jKKZ52rN8iJYl9phASCZLHmGyluokF18WdX1Oo4HGxPj8LXHGDEyUemlxRSDkpkzKG7gT4RfbXqG7p+uSOHas98Fw4t8DKVGHM2HcCS/U4xZqtMpd5iuGTYpsKnzxMsERtjxrU7W5dWIK/SHAmfv8+wwrLS7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781012; c=relaxed/simple;
	bh=JQeceI7KRdiS8UWUN9fH6U/W/ft9PgtgeyIn6rv5Ubs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFrlbLyB3191qZsmd+21W2zx7uszlVt66sRVCeDvuVS9v9fy/xmyGY9jE0lIzoLubcU63zXFFrDLyjQfafejZ3nh4M8FT8wEHtPKLQjoX9Bu6htfftr9Hn9dc87zwENWQE6yakCvDEBbID3UiINLjExZbD4Xb5Cmc2rEaUqVzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ee12baa01cso56945715ad.0;
        Wed, 15 May 2024 06:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781010; x=1716385810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c42AMKwgSzOR66r+AjpIMgvaXg2qsxBzL19pIa1VZeA=;
        b=Mk2XgpnjMejbb4PJjtsofeHe8dy8hjjiDOkXzCTaDhKuw/V5g6e9JccISC7iYEVUcg
         d4cFSWHoNmqo5ib0+ztINuqiFf2vnlcm6q7gjNk2vFCem1aazLPlyLcR0/2WxczBzQC4
         M6X/A9BlbLSPv/AKhAFtwyLEI57dEs3pNoY9ukY4P+UuH3MH64tCGWzq8EX1giEDz1bJ
         DoFvUGr0eC+ZToFmuloauw9Kw1fZhnKeXcO00OhHjgvLqVWds49SYjEFeZ4V/OMtDRTa
         LiSN61iZhiVfClcZNbicZ/SjwDW/wZq0G4/aICkZBDxbjaA8uOgJbYEXDVHq63zl8HPB
         4/qg==
X-Forwarded-Encrypted: i=1; AJvYcCXpdjT8xdY00/yIJR42I6srlob4njxthJXJPNbujLEbdFc5Z538bxTqZB/9RV43WO/R2I8sruNJesMUYIaKeSgC7yN4JtMLBPNzN+TL49Z+F6nhaogJ63p+VpssAPCv6TW59hDi2H7P0g==
X-Gm-Message-State: AOJu0Yys94GIslYr0jNK9uKmtb9XwEkSqumMi2Ab/1C3rV0G4Y+Uk7Fn
	nzozYDOgfi0bm84nwpX08Yk7GWcEqUAMViCg82pfojdQTGCy7Z92
X-Google-Smtp-Source: AGHT+IFyYmeziyZSLQCNAch657pNyMyIvP8fHXe1QYaHasb9Fm412ALTshQGUOeHFOQ7oNPpwrGVVQ==
X-Received: by 2002:a17:902:c407:b0:1eb:61a4:a2bc with SMTP id d9443c01a7336-1ef43f4d1e0mr177965365ad.43.1715781010303;
        Wed, 15 May 2024 06:50:10 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bada405sm118808525ad.92.2024.05.15.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:50:10 -0700 (PDT)
Date: Wed, 15 May 2024 22:50:08 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the devicetree tree
Message-ID: <20240515135008.GA450088@rocinante>
References: <20240515130139.2da899c0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515130139.2da899c0@canb.auug.org.au>

Hello,

> The following commits are also in the pci tree as different commits
> (but the same patches):
> 
>   15be4f7ce5de ("dt-bindings: Drop unnecessary quotes on keys")
>   28081ebd17fb ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'oneOf' sub-schema")
>   649bad67d4b1 ("dt-bindings: PCI: microchip: increase number of items in ranges property")
> 
> These are commits
> 
>   d7890a80e037 ("dt-bindings: Drop unnecessary quotes on keys")
>   301e978b9eb7 ("dt-bindings: PCI: qcom,pcie-sm8350: Drop redundant 'oneOf' sub-schema")
>   247edade4b4b ("dt-bindings: PCI: microchip: Increase number of items in ranges property")
> 
> in the pci tree.

I took the last two, and dropped the first one, per feedback from Rob.

	Krzysztof

