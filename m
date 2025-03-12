Return-Path: <linux-next+bounces-5774-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A22ACA5DD7D
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 14:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30AD07AC109
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E45241691;
	Wed, 12 Mar 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak6hIBXK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5388F23A563;
	Wed, 12 Mar 2025 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785031; cv=none; b=aGkwo0CIBwcs/88ZJqODZSAxdqqFD17k6M6vvh4lymyyZTBD8C7CqIe+uZi0Cm+ri0LmCs4cf7gDYaq4iHdDUXqhEf6QWSGa00eOvSPYypni4Suosd2/fHXr73eo4xh9cxI5ONLEejqlPnT5qeLB+sOZ7zaRHt39jUwxkhlXtns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785031; c=relaxed/simple;
	bh=03Su45tvg5hFXwoAPydc+kGyfPPw0WcDWLM4ny1iarA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+7X55JqUeWl1YqbT9o9FHHo+l7CUfwe8t4DrHKnZ9qM/HaI5L8RUoF5CBJ9wxY9ZstfvBT5K9OHVcPgCp3WO7ALrClEJ3NNzlHdX9mthwxBS9iWt2yo7qALroPUaoG52f5TPkoqjuVHtyw/ENZzwVm3aRsT0m0t60xA6Mm5s/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak6hIBXK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso907500566b.1;
        Wed, 12 Mar 2025 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741785027; x=1742389827; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75nPXSZjGPj5ZqtWjCrn2ByIMWAAHynamAN9dBikK2Q=;
        b=Ak6hIBXK/C/ZIGOwVog14q9wZu08wRIZ0cQ47j1eHNQ+ILuyoJd54FKoEl9siSRf/H
         VZ9PaTAW7fJNWfWsck7OpnCVYAB5SCBOQd4jmaZOm8zaNGyD5xKEhVdmSgXJSYtV10KJ
         V5x52AGgAtjru1HwhbX106fDhALjOn58crpIEKpOUI2Al454O1Yqt6MZIU/Wl6iKmE2z
         uotf5jEJU/xJDFZhjwSn2vA/qGn8Gbsb+PzxJCKptrms1c0zZulz+pjVVoqNkTZDT9vW
         DCblkHO47Uf6Myfcn6lQ2vUacdzJ5OQoYAlPYxaKjZl5aVlKr/IXh2lcaSrI8HdLDYlq
         w7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741785027; x=1742389827;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75nPXSZjGPj5ZqtWjCrn2ByIMWAAHynamAN9dBikK2Q=;
        b=vKNpwkdtmyw/HQi8D0KybWMjEH4ZTMi7KFIqsZ9Sc+Vzh331wbVpA7fY+/HAMgjJJD
         /iyG0bkeh2dkTMU87BvHFgUPYK4VYHet4dKLCXR3AnmQupBU+Z8k8GqLTcH2se7jPrjF
         wOKv36wv1cn0k7IQfWluMvbdZixi8cJi13RGQbD3qlr7RNX6TEvyWYMzMuWPgsfwhl0u
         +nGLWSAkPnXQcbl2DIdHLCgbEptz6tygZzcHzqvgY1GM4gDenrWl+wCqVZUx19W8qjqH
         29+aUMSiGHMoTiRpFc8pc7W/QbhMA6zYN2xDWQZvdR5KvENE5Q5oMcpd9KdUWdPAM4oV
         CeEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4G0QhvJOTix+rOQdjoHOxlZkk27OIGCwSIeWgKDgOqVflK9gP93oT/Wc/B5C2pzhIU2iWGRKmKluw9g==@vger.kernel.org, AJvYcCWf4DiVw0j7eHFLHsqzJS4aQlLzanUMAqboHGVJHZdvGxv0wj1RovYxb3AyjpKIv/QL4aTbysyBtESPf5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQoUZIGc/mTRvEzk/qFEHLpo61qdg+v07J1q7aQW6VMQnlybg
	jPzXio4+JA2hHQmgRh5TUb0G/N7QLJOm3wUAA/3x1sFb6O+N3Gn/
X-Gm-Gg: ASbGncs18bo7PGukkiHTJN9y/ZrmrsA4dTI886Egva9zpjUvDyaF6DOT0ysDxy+znpB
	M+2395/5utE5snB5TsEDRhvDPVHmM1yBa2rJ/0GH6+xBzDDrIsoAOpl7DvqRoluSik9iCDVQirp
	rnKY8/ABV63JiFVO2DHJZGqQeMbbZq0RHfndxk7CBN4eIOHCsGBuOXXFe6CPRBqbcCNmAGOCy9v
	N9TmUmGnuzK4l1Al6R4YP+4690WBBVYFksxIDyit3UQLfv5IzvUtGrng+t3KAwu8arQiiSMZxU6
	r5jiQ7WwVWon3ReTF0umoNAtd+pmMvFUpuWaBVjncUuY
X-Google-Smtp-Source: AGHT+IEdDRJ6qXBMfKuc/WyBjixNVZydYXAZICqURhWRFKP3xWJo0qizR4nH2ita/ugZWSSNuJlntQ==
X-Received: by 2002:a17:907:c0d:b0:ac2:892f:439 with SMTP id a640c23a62f3a-ac2892f132emr1958853566b.37.1741785027200;
        Wed, 12 Mar 2025 06:10:27 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a21f34c1sm483656766b.19.2025.03.12.06.10.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 06:10:26 -0700 (PDT)
Date: Wed, 12 Mar 2025 13:10:26 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20250312131026.lk5jqrzyrmrlt27v@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250312113612.31ac808e@canb.auug.org.au>
 <20250312021420.nvkahcd3enlt3i6s@master>
 <20250312133050.1d23ed5a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312133050.1d23ed5a@canb.auug.org.au>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Mar 12, 2025 at 01:30:50PM +1100, Stephen Rothwell wrote:
>Hi Wei,
>
>On Wed, 12 Mar 2025 02:14:20 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> Thanks for your fix. It looks good to me.
>> 
>> If it is ok to you, I would like to merge this into the original commit.
>
>Fine by me.
>

Thanks

Andrew

Would you mind merging it or prefer me to send a new version? 

>-- 
>Cheers,
>Stephen Rothwell



-- 
Wei Yang
Help you, Help me

