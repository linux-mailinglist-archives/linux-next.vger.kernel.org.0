Return-Path: <linux-next+bounces-5312-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62775A1A81A
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 17:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 259743A9B75
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 16:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614EB170A1A;
	Thu, 23 Jan 2025 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IvIsJGoq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEDE13FD83
	for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737650954; cv=none; b=ffsF0dS6oY/IWvOboj76a6cXftLJc6cGm2IMFpg1j2RJxdHQVV4ImnKwGWkc8MvF6AkkT9lGirioJin3QzPExeR41qDiya4z98RUp7y9p2BE8r9HqEqAg3kvz/2OZmLbjR79ZY5xJwtar0/RVoOC7rO8vwMEmwgcrQbAzwQQF0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737650954; c=relaxed/simple;
	bh=hYLucHQ2GmvyYGM25CegMuMOk06ntWJcKyymmU5cPNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/2KiH1+ImBYetsIq3lHVX4k5Q6wkH5ryjOxi7lGPRtrIOCigYAjzgjatP6bDMSpqvGulGSU2C7LDBlHUueKv7ZM3jakbn5WXqBwfyy7HvGKfy+CN6LNPba8VVY7Ceul7jSS1Pnqgei+zvdjQyk8/8BFWqPvF6Eyur0PtNP68N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IvIsJGoq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215740b7fb8so220985ad.0
        for <linux-next@vger.kernel.org>; Thu, 23 Jan 2025 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737650952; x=1738255752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8Ktjkvm7S5NoXz/Y7DuB0HrZMbc1D1VpyZ2582WTxM=;
        b=IvIsJGoqepVok4tD+hN8J2tEjle2QwzJiLG34Avvl4Plnc2OABhaS2Xl0+yjjF++MP
         bq6IfuZVyV+3UTt/L1NzoKt5MWTWxRUhex11Ta1Ypn93p1d5e8maV+Z1M1W9hZ5IA7c/
         NCh01KtUOjKzYW9FJ9zgoRguZ4jpcxWfAwQ5Z4vFbdva3l0uFXdqyekoTBI8XaR3l4G9
         /gAyE6Udz33zs1JtsBKbPIg69w5lBph/ItfS29TTml15QrQfq4CpD/aDVGPgfBIcNOz5
         agg9DL3nzagN71i1I4SBMMkMUcrTLPcLCuGm4qHC3Q0fB63FqhsaIZWbCNWoCKEmuNG8
         Ijmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737650952; x=1738255752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Ktjkvm7S5NoXz/Y7DuB0HrZMbc1D1VpyZ2582WTxM=;
        b=WESouBttaO17vQRKFhSig8VOQbuWvKsKZSWSIfDShiDKMHw9MvjOKcE0f5lTcGnOq7
         IeLYvVBKJIPoOCVhJ0QllTx02F8CQsVnpWq+hRS0bm2F5asLAU0kpFGsPMmbcwxSD7RF
         TqV7W0EOrtYJRDBEHDrPK7SO2V79DdekioBloUGP10qM24B5HBjbYH6bgOvJ3sNzmTCO
         r3UEFu39XkcHCMMQs3bPHzlsTzjAwScfyflsBKpzplQnJ9QFihAKVq8VODpFEoHJwYax
         o40CkVRsx2zdSFKfFxbJCOunFswDRxKvd+LlZLcjIDGpw+BDUtnJL9rfdVJnEI7u+67R
         YHsg==
X-Forwarded-Encrypted: i=1; AJvYcCW4/348rUqEfSfLalRLi0oc2JMhxpD3MgTo0fXbd5FEzEUiSi0vLmub4Q+QOw8In7WtNkleQzVcVaDg@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpp16JU3KKSwjj5CEgMi/AmgayHOx6fClmZxPf0B+SY0Wb8AY
	IMIWnah80jdoGO8D0jKxxDF0yBIa97PHDgd06GUDvNKasv1PL7f9Xoh5YqMtfQ==
X-Gm-Gg: ASbGncvgCB7WYsdoP44M30Y8Exv2LzAP9vh1BzA/eeyg6w+88RZJlpZBq4wAvXZvs3X
	r+tehdEXnpUKLd/t3LicZ283pczksVUQ+XcgU8wKQ8P9cVLyyhxoIscclX7oBh6PHEUV9cSs9ue
	+/Gd17vX8rzrGcXfSVUCPjJbRXW5hgoJvnlomp2c0noEyE5MUu8Yr0KziVCxT5lUe0GqdieAbSs
	vahpoM36pEBQnhXW0MFsEd+eEXi4HTUi5vFOrU3M5h5TYXUFZed320ijI0dXcwDUxPAFy4qL6/P
	Vct4jqJqqKkudXzdn5cV8TVhycuNx5VuzPsjv09Wmkk=
X-Google-Smtp-Source: AGHT+IEdI9sfswL1CKpgteGUTpoa8KzLTHDzZUTd6md5ndqBYJhxcQogQX/2Fh+WAvAdK1DX0CjY5w==
X-Received: by 2002:a17:902:ce0a:b0:215:7ced:9d67 with SMTP id d9443c01a7336-21d99cfa7a8mr3019815ad.24.1737650951932;
        Thu, 23 Jan 2025 08:49:11 -0800 (PST)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e38esm1259485ad.3.2025.01.23.08.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:49:11 -0800 (PST)
Date: Thu, 23 Jan 2025 16:49:07 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Aleksandr Nogikh <nogikh@google.com>
Cc: syzbot <syzbot+7015dcf45953112c8b45@syzkaller.appspotmail.com>,
	Li Li <dualli@google.com>, arve@android.com, brauner@kernel.org,
	gregkh@linuxfoundation.org, joel@joelfernandes.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	maco@android.com, sfr@canb.auug.org.au, surenb@google.com,
	syzkaller-bugs@googlegroups.com, tkjos@android.com
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binder_add_device
Message-ID: <Z5JzA2OMokMz4Mic@google.com>
References: <6788e8a3.050a0220.20d369.0031.GAE@google.com>
 <CANp29Y4ss7w4C+A2rgy45TqFbHvFoEAU9fq8JJxq_DJr74+WZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANp29Y4ss7w4C+A2rgy45TqFbHvFoEAU9fq8JJxq_DJr74+WZg@mail.gmail.com>

On Thu, Jan 23, 2025 at 01:32:29PM +0100, Aleksandr Nogikh wrote:
> The problem began to appear after:
> 
> commit 12d909cac1e1c4147cc3417fee804ee12fc6b984
> Author: Li Li <dualli@google.com>
> Date:   Wed Dec 18 13:29:34 2024 -0800
> 
>     binderfs: add new binder devices to binder_devices
> 

Correct. I tried to mark this commit with a #syz blame or something but
I couldn't find anything. The problem here is we add binderfs devices to
the binder_devices list but we don't remove them when these are kfreed
e.g. during umount.

This is then fairly easy to reproduce, something like:
  $ mount -t binder binder /dev/binderfs
  $ umount /dev/binderfs
  $ mount -t binder binder /dev/binderfs

It should be a simply fix. I'll send a patch later today.

Thanks,
--
Carlos Llamas

