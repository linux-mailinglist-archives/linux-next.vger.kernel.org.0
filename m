Return-Path: <linux-next+bounces-2815-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E5924CEB
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 03:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E3F8282FAE
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 01:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C0F1FB4;
	Wed,  3 Jul 2024 01:00:04 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018081373;
	Wed,  3 Jul 2024 01:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719968404; cv=none; b=Ioe1ZGgDlK7m7I7e+zF86JDuTfeyWNHoqthS/q/4oqO/E7QJ3jQ9MZvVFZnIloZ38rG9dOEMhqdJSJaTxpQZFD+77fznXOZHv6AhjoindsiOlDxDSENOrzxSZ8n0XXn1NCwbh/RKgSEzbxCRyGPv2fq5JnOWzAv39GOPLqJn8Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719968404; c=relaxed/simple;
	bh=4/ok6FYh3Y1KvnVpgaAOy5hhwMjG6Ts+SeLcbCbQI48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqxmG7kXs3z58aoO+QsHkcUE3Q6uE8112YCyQ00plceJ7jqbr784h8AQW8+TPqaSvggpJj8aORw3ssZM2nZt1mohjwRHuiZpgZbOKpu9nLUSKDmDvXVB/iEONnHJ9NI0jdj3Z3o0AXU5DBBrbo+hbykVh9ii0x47BmmYppF2Q1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d561d685e7so3362827b6e.1;
        Tue, 02 Jul 2024 18:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719968402; x=1720573202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+QDVDPryOtBIHWupkn8RFbJbvX8vqSQWsza45FhNfM=;
        b=Ga2F/UWKMf0Bme5g1N+C6zzyLxFqugCCcU3THav5nJzz7qzhAnoahWLO5MSbd64w29
         65R+z3FoJqsWArazsdxCRdQ89+0S5AKJAM9vtxwmPyJQSpHGKVhSmTBUEE+yZeDNt83b
         JyqJo6RKYXTqI1qnhT58KxJSR/ZvqTB+VM77wqp+fMk5Bn7fnpfy56KuwpVZRtRLDuRO
         Vx/yK604tcyJ92KA/3u+uns/UxypU1ld+yckFczVfi4jCKOjjzmYJQ9fx9DJGRgUeIF1
         e55Kuacaxy/6UZqZiiHd6t203Q8M4+BUYO3CFIDr1Kq+n+IR3Cds6ceGRtEudejtXNY9
         RrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ciCRzWw/wd7jJnGQrNOD1CDJG1chcBBp4JOlOh+4l0wqZFCt1LX6CpfXxuWR+nh/rsUXizwPZsCs9QdugoelqtQIkan0lVk0ba2jrOiNa6JX4uMdMXpPjx0criPn8BdVqCzF0n1P3Q==
X-Gm-Message-State: AOJu0YyWOlbupdO7pkGZSfvxVS6JTNfrop6JFXrBIdFbRJo6Kty4sHhJ
	Qcg2J5eVbGJkClahJPTEUXPGEAHlPc7XtqzgfO2Uow6hGjhmah2AO/wPOaCZ
X-Google-Smtp-Source: AGHT+IG2jepsnH1O+TW9oT8SdXRcbhlDe0GQgRMpprpz3qpC4jyruP1SPQgPV3dCZxlhk+3gPppKWA==
X-Received: by 2002:a05:6808:1284:b0:3d2:308b:9bb4 with SMTP id 5614622812f47-3d6b4de1fbbmr15041145b6e.43.1719968401976;
        Tue, 02 Jul 2024 18:00:01 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d41655fsm7156351a12.92.2024.07.02.18.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 18:00:01 -0700 (PDT)
Date: Wed, 3 Jul 2024 09:59:59 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20240703005959.GA3160262@rocinante>
References: <20240703104512.59dfc264@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703104512.59dfc264@canb.auug.org.au>

Hello,

> Commit
> 
>   1ee61ee40d2b ("PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers")
> 
> is missing a Signed-off-by from its committer.

Should be fixed now.  Thank you!

	Krzysztof

