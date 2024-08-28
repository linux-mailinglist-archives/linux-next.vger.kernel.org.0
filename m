Return-Path: <linux-next+bounces-3480-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0689962968
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 15:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B5B31F228D9
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 13:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB4518787A;
	Wed, 28 Aug 2024 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU7Oxfuf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A09D166F12;
	Wed, 28 Aug 2024 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853333; cv=none; b=agr+mKTTBRUbfwfLL+3/TrmkCJcBCRMSf6H3H4N2YeRwGOiyJUGDZpprYFP+emrBGuUw188ScR0xKauoF6wg4XEnkcTVilX9u0f0ttJKEr/zF5iL1xpNbczGJAh71SME2KsKEww1G+3ZogqhVhbMe45gH57kRv8k10rex0tcduU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853333; c=relaxed/simple;
	bh=T7A9OKxVD+kUh1dBfxfoeIsZ+jPK+WqU9Yd2oHF9IBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEUAuANgUP26k57P1WVlOlyvag6AK6UVnz8UxURED/o+fPzVuak4j/LorM7dtZhNShOfIq8xKgqsfRA14hk+gjJU4hMFrzDAxryzM1iAxl3NLUBPQQ98Fa7B5dbxxImXZvBNUtc8Zax/6ShUUxRyvdE5KJvB+wafLVwb5+U8WAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU7Oxfuf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20219a0fe4dso67303545ad.2;
        Wed, 28 Aug 2024 06:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724853331; x=1725458131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4wyz9oq2+uo78sncVAg8Han+f0DiXPvx+LqXdAdVKQ=;
        b=UU7Oxfufj1IYZOTNHQ2beRH6Tki/zAQ6rdZyPA5SjWvoMbmfDiOVTOxs7kjwqpdwF1
         DckiAZXANI6TI1qugVoMkeTGrmhZA5jUxmoHsHjf9AkvOQ5HTZBfhthjgM9oXgwAzncJ
         QaaYbRuq1ZgUYH3pQ2gNaeX2tedEKKSfs4A7of4klk6W+auxqC7JG69+Ojoq5z7HrbQv
         7tvFYlD8AyIhvgj8u4quTfYF8nw2GkXySxPGTVvMMK9MyHk6WR8SSTROm1VpVEp3bmpG
         WRf6zeGQ8ATUTct5hR/zJk/POZjP/HKI5ul+9k1xWaB51tRZVS+l9yztO+zy7qXabW4L
         ko5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853331; x=1725458131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4wyz9oq2+uo78sncVAg8Han+f0DiXPvx+LqXdAdVKQ=;
        b=sBZkVnylMxywVXTWx3gwyzabPjmESdhWmpXfC6cSq8QGjVRal5HIQKXGd/cK0zdtQB
         3rKhHHzTpyZRqAMl5xyh6qJnsEoxMJX/97uT3mQHOC5NCxZKP5VHWSo/TYv46p4w2mLI
         ixSD5m40vku0d8cnXfAZqK35O1xykSstxWLyYpuKqWrBGWcxi8B2D362b2gsRwnobP6z
         Cx7IJatr8bDXt7rSAN2XyBxPElRRbd5g3Sz6nZfqFv5tGjVbvawMwLBUBdFfCMHdSQa6
         I7r7HDrWLx4tAtwNzeV5Ro61O32fQnI/ANUZHT7+exXHcdwxsC07+HblasKX699Y9kdu
         yOrA==
X-Forwarded-Encrypted: i=1; AJvYcCWV6gcuB0sJBq2ujL8a1MHlvEQfo5dAnb3dG9sm56CW4Cda2gI+63qH+gGULmB1hlxBFSt2Fk47893K@vger.kernel.org
X-Gm-Message-State: AOJu0YxcZBSS4V7XmV/uwJ0u5LtWrIanFtyTZUq0P7BfKujqwDMjgE6B
	2gtle9iDZfIolHxpBjgaxQ7H+La1SpuypJP4Swh3eJfFzbitzyIPOcW8vt43
X-Google-Smtp-Source: AGHT+IHkLBNXhLQj9XS2vZl16T27KDVe+6uzUxbB4dY9WCX/gD/hOuH1WLSRN5Xlq1i2d4C7t99SvA==
X-Received: by 2002:a17:903:32c9:b0:202:9b7:1dc with SMTP id d9443c01a7336-2039e514e79mr230746305ad.54.1724853331268;
        Wed, 28 Aug 2024 06:55:31 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385607e95sm98996015ad.184.2024.08.28.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:55:30 -0700 (PDT)
Date: Wed, 28 Aug 2024 06:55:28 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the bitmap tree
Message-ID: <Zs8sUKu5D49GKD1F@yury-ThinkPad>
References: <20240826073216.5c866e39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826073216.5c866e39@canb.auug.org.au>

On Mon, Aug 26, 2024 at 07:32:16AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   227428f1b724 ("lib/test_bits.c: Add tests for GENMASK_U128()")
>   d39bb8bcdbb3 ("uapi: Define GENMASK_U128")
> 
> are missing a Signed-off-by from their committer.
> 
> -- 
> Cheers,
> Stephen Rothwell

Fixed, thank you!

