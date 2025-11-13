Return-Path: <linux-next+bounces-8952-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 09263C56653
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 09:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9A81A343DD7
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 08:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573F82DC352;
	Thu, 13 Nov 2025 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RA6oAaBn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8uEiwxq"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A82274B37
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023777; cv=none; b=cwZc9sZwfuMW9/Tif1jVf52jxjCKA2uGmUeXLeiaBtEzamNaFoXzLIm+AkzaFP1FFeK+p8McxW+Tx3HuB79kevm9Fmg2wNCO8a5St05FRWeLQq+E7rXarrisQ/QcGbD7zVoAB+/l/64RlVCHCmAq2eJxuLu20UsAnI5y+QSVWeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023777; c=relaxed/simple;
	bh=3ClZSRwKg6h2JUvk1lfL/Ef52AZNj5csT+dOuK9K3pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5Q+qzuwPVNcek/edaCqcGwFxMJPF1Ar5bocIetCRqQHR5oLLSA9VVnmJQtELKIb6X6bwSvNV5NnKL0GN4g0FnKKEMouU5ePBwpJgtGFMxvRJgBg55mPpAKwaJB0EvUIpRS4Kmq3m1i2VvvhNcxeCVTY1VxdnKLhW+62i8YhCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RA6oAaBn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8uEiwxq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763023774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+z22V+mQXu1nf5PZ2QEjbDMajJwQynoOz1yV7a6Q5o=;
	b=RA6oAaBn1TRsUQ9rh7n6GAuye1fTUutpRzpM1EdUm+/GRIQ7Hm1+wtNBF6hdeq39bRaktK
	DlnN8cWqnfhdS6Tl6pMSavVY2aydcaHv0wB/tLMWptfbmK/hjK8+x/c+Cu8D7COkCEvjc7
	K/0Vu+ul36TH/zvuDly1cfrC3uAvnss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-JzeYsJX7Nh-kj2pT-6RTUA-1; Thu, 13 Nov 2025 03:49:32 -0500
X-MC-Unique: JzeYsJX7Nh-kj2pT-6RTUA-1
X-Mimecast-MFC-AGG-ID: JzeYsJX7Nh-kj2pT-6RTUA_1763023771
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477792eb8e4so4051375e9.1
        for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 00:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763023771; x=1763628571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p+z22V+mQXu1nf5PZ2QEjbDMajJwQynoOz1yV7a6Q5o=;
        b=a8uEiwxqD2DI4BC2KdJ6Y7svMM6qTDyPRlzI8DGf+W/tN3chbKheW8wQq52fiVejKf
         UKdQvVQtG7jm+jDNLjwPc7cRDcNiL4IVFFabtxgg7IKP6v2X179LYEDxkHZ4l3jk66lz
         eKvkZ35uL1QSd5xeNDS6JO6ylbBI0u6IrJNXIBmL6rFTk4EqRaBf9ZSgpIqC+ZWrFhUC
         4ULrJEpKy5palsTOXEPE1cc1htKOu6aka+R8Cve9ZiDzLxUcVCZe3IXvVye1/a7u5s1w
         pZV3swsmyqZlhEaAUrALgIqniBIY58TJNuWonzfl2Mt8zR9Hn0X7BSxOKH1yehXnxZbQ
         vJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763023771; x=1763628571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+z22V+mQXu1nf5PZ2QEjbDMajJwQynoOz1yV7a6Q5o=;
        b=utHD1SNCw/fuqhnMYQ4ufXzAgstMqudA3LvAnhtFqfX/r9UrHHiRLAPXvaPiCPDljm
         3Kda36LIK4UkVzz2WuPeadTWABH+v0WWs6XlWZKJXmi8CVWSGe0QGaa+s6kQency1jI2
         xO5uwczQM1SfQxu4CibX6x51Nd63hjjIvEU0yG4Zj58Xp6vAc0Oh+hT184sum5Sg2woZ
         pjhMtiicBtB+rbBEFhcKc+MvFWV0AmVu00kRoR41hbosXBzmAzMLacaNZkZCVvMueUvC
         Hoq1UmPNXxFYK385wbh8u6lgpfHHWrJwA+m+3mgjIb13uG+Z2J9ltN4nPQF0PEoihkM9
         dBsg==
X-Forwarded-Encrypted: i=1; AJvYcCVPN6g6v53hMnf/8WOfA3xjN0bj4wlRA4i2KhXwP8guM/M2oCR8OBoyn7MHPdtIbQ32kpEDPDtfaX+f@vger.kernel.org
X-Gm-Message-State: AOJu0YwCPN39FoThaJB9plW6dQiYHeJxpHixxD7a6Zpu1QKVRjgmxf+D
	OjugLS04UK0uJjrRLq73zOLXQQqN9KQQ8ZnnlJNLWhTkBRbOUa+qn5ESqKEOKcx28uK7MxX6j4c
	rTvjVsJg9eLHLe3V6KGOxrgVE0nhYn4INk1CDT9GCSf8irJ3qmaceWBEtjsZ+gOo=
X-Gm-Gg: ASbGnctLNfu9AB/Ym/0jcFdd3KiTAbdyot9cmLHr6NX1u6LxCVhQRRjOW3hS/t4jLrC
	DTYR/Qjw4sojm4dpKaiz+W1zAbiBBefmN0Nx5OPy1+DCY9gt6zQFcl4tbEsluBvDGFQH3wbWzAF
	PKdMHixNYMze4uC+8hoDJGc15+h4AATxBNr60pOcX4Y7/FwYUhb6hocd3vf4HHOFy33b+KlFrJ1
	6fRiFAO6WkMhgA4sUj7BRwXFkt7HJ7+J4MNf+zv/c+FNbvsztHCDXjrCuwcifPp1RCTpvKAc2WI
	515/yxwqU6ECEvrLjOvIDkJKaDus+gBkXxn0VfSMQkwKZvjNmkgL86stZHTGiDo5G82VCKjskPz
	7DJiM9l8UxnFBaHVi7Hw=
X-Received: by 2002:a05:600c:2e0c:b0:46f:b42e:e363 with SMTP id 5b1f17b1804b1-4778bd3c9d3mr12295615e9.20.1763023771337;
        Thu, 13 Nov 2025 00:49:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG45gCQVBXnCfVUnX5RAwHFpjHJLZDprccGjGKuZEJPutU0CB1G4S4/9nDPL6TE+hr7KwP6dA==
X-Received: by 2002:a05:600c:2e0c:b0:46f:b42e:e363 with SMTP id 5b1f17b1804b1-4778bd3c9d3mr12295425e9.20.1763023770818;
        Thu, 13 Nov 2025 00:49:30 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2a7ddsm2605263f8f.47.2025.11.13.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:49:30 -0800 (PST)
Date: Thu, 13 Nov 2025 03:49:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of Linus' tree
Message-ID: <20251113031422-mutt-send-email-mst@kernel.org>
References: <20251113125537.0d08e5ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113125537.0d08e5ce@canb.auug.org.au>

On Thu, Nov 13, 2025 at 12:55:37PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (htmldocs) produced these warnings:
> 
> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 duplicate section name 'Return'
> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 duplicate section name 'Return'
> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 duplicate section name 'Return'
> 
> Introduced by commit
> 
>   bee8c7c24b73 ("virtio: introduce map ops in virtio core")
> 
> but is probably a bug in our scripts as those lines above have "Returns:"
> in them, not "Return:".
> 
> These have turned up now since a bug was fixed that was repressing a
> lot of warnings.

Indeed. But the rest of header says Returns ... without : so I will just
fix this one to do the same. I also fixed other issues in the comments
in this header while I was at it. Will post shortly.


> -- 
> Cheers,
> Stephen Rothwell



