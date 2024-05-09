Return-Path: <linux-next+bounces-2245-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714938C12DB
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 18:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6048AB21F05
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 16:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A4F171E4B;
	Thu,  9 May 2024 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWT9EtRY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB41516FF36;
	Thu,  9 May 2024 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272086; cv=none; b=XCcayYUTG/9KH5d6U67FVZjG8WxfbVtN/Q0AHaoUhYBNoxETexXwIMnl0K+orYgn9X79Rdg7iVsdeRdgaGbfvOI7pvkdkWm1ihCQsU1QrdByjaXtFjaUtIQbobw/IuUo5s+196vfYYWx4Jmw0HXL6CzejTG82Gj2xX6yRNegC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272086; c=relaxed/simple;
	bh=OScTNVyULRAueIoDGAd7idPhiaWzU3/uRTxLnx01elo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSqlfGkJ9cralbn02QDD7cpuf6zsfKtOjiUQgP5HghbYJNHkFuNQOML0iXr04wODNG853jHB5V1cR5TAl6qQMDkJwjsP74zi/IWE6aIev2vLzRtNfRf7wDsNiZfGvAWtk6XR/rcgUk/xSH7+X39QzsAYDmsnzqXRcYKR813SmNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWT9EtRY; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61e01d5ea74so10635287b3.2;
        Thu, 09 May 2024 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715272084; x=1715876884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JHX4kMt6lPpKWo83iAuzN6eiPgSCKTFJ5+OKh2NyhQQ=;
        b=DWT9EtRYfrR/AQF6yF2IVshl1JaO0R8dQrNgzWSUnYcoDl86mT1Fycr9mHqFljcmBw
         LEKVemWw+H9ZUU7WyGAUnmTdSvq1FWEPLpk6NgB9ELVAQfLpoqRm2G+xmaaIlr5oLXa5
         9DatFMLHFNnbd80x9mC6ZJZUU4vIaXzBWeT2Am5QE7cMDhSnW45NRX2/z/8Lqbl6h4pF
         LoHxAell/84ZNxW0fs+aiugXf9RvOwK8qpafA1r9vlB21gj9uViyTd2kGCBPghXwaOG9
         Grx5ceNStKdMl1YZ2VJu3zJRmM7g0yr0jw0anz8P+aJa0Z4l84wlDJTITsWiF0xP953u
         KOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272084; x=1715876884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHX4kMt6lPpKWo83iAuzN6eiPgSCKTFJ5+OKh2NyhQQ=;
        b=vbeVnWbyhdSCeVOc2gE/7lRPhi+FEf8Oif3kdh1rURq+/K/yfjONEnA/lL5jnU0hnh
         qmPTghQVKhCRFBk1Pq+gLnM6TUzuqf90wq+i+O99cU8IYEh2bwvFdA/vKQqT4vsGCjYC
         vAMLDqNU1xoGSacsFkbmEJ32LCzgZKYXbU8I9SsvC2jxtms95ll+e5pGozyUr98TxOiW
         03IZAQRcPMVy7+xnCmPGM6QFferlMI1CzolScV6jwe3YCq3bsIdQZvT5WWTOBuURq7sH
         0GXeWMOw3sa3FnhdMNpdLBbVljaNlm4hZGIEudesOzC2qPsWp3s5iIfA/A49TZpRdKeF
         9dwA==
X-Forwarded-Encrypted: i=1; AJvYcCXnj2b8+ph09tXwxU/I5mCbakB0gRc4LV6xQRnTz6fR0dUZysiGRb8v/Gf1GE+DyOHt6J+tjC9oawAATlHwFSknOhJtjVqdJywJ6Q==
X-Gm-Message-State: AOJu0YyPv3mSA8CM4i05h44B+j123vkBlnLm3+Bi5xkk2KcsgLo5BVOZ
	f8kpQ60eD3/UCRVWB+IC51oGv7nfMoQHQdYyXxOCA/1X8vao0QJr7N3YRg==
X-Google-Smtp-Source: AGHT+IGjrjor/PgbJjl7Oa6Cm1F8/ZYxdblDz4xkKztkQFJ3UkO6X29WIpbKzBiw0EtOZUEM/HwNgw==
X-Received: by 2002:a81:7304:0:b0:61b:eb65:4a87 with SMTP id 00721157ae682-62085d80a05mr60157687b3.48.1715272082610;
        Thu, 09 May 2024 09:28:02 -0700 (PDT)
Received: from localhost ([2601:344:8301:57f0:843a:c0ac:92b1:38f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e0261besm3572927b3.0.2024.05.09.09.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:28:02 -0700 (PDT)
Date: Thu, 9 May 2024 09:28:01 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the bitmap tree
Message-ID: <Zjz4zLTQB6Z2HB/U@yury-ThinkPad>
References: <20240509084252.3f7259af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509084252.3f7259af@canb.auug.org.au>

On Thu, May 09, 2024 at 08:42:52AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   552467a38cf5 ("arm64: tlb: Fix TLBI RANGE operand")
> 
> is missing a Signed-off-by from its committer.

Hi Stephen,

I added this patch by error. Will drop it.

Thanks,
Yury

