Return-Path: <linux-next+bounces-46-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44787F6620
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 19:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 297B0B20F0F
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 18:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6018E4B5D4;
	Thu, 23 Nov 2023 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoNC0Vd2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49A6DD;
	Thu, 23 Nov 2023 10:23:27 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso960511b3a.0;
        Thu, 23 Nov 2023 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700763807; x=1701368607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/WDOh56LZsmF1rgzz5n/4XFYOkb/vHaQkdzQXWa4zs=;
        b=MoNC0Vd2lYo1Jb/BwR0emwbas5bv7PFQ2e62xDY+gMBHBEHFMJ5a4tnaKqe5fVt08T
         4sIaKTsJP0l/K1450/67BioMv+ZR90g+rJ/l7FEQ8jnISFvLFnTKOIaF3PWDXLj5G9Hb
         1PJ51SyvI2+O2VgAJLRFuMWwuDDgIIToasDRLyLAqC8JuHtnOIsG5t1lrUag+quaUFP6
         uIPChAQDWSDtB8rbrKos1di9tlWWepmYbn7SnLT8pKMba/CIJxqKT3ChkAJIp8IALoBx
         UXuy7bSiPwdiSljcEOxKETG/DTxdxx3YWnfL8fweMz3CBXc7d66LJNQDPutiuAoFh0YS
         eB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700763807; x=1701368607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/WDOh56LZsmF1rgzz5n/4XFYOkb/vHaQkdzQXWa4zs=;
        b=aYPKgy/fsHlSxLvGaC02drBYRcDEZW4tWpTo41G54Jz+KD5GSQuIstoHeK035b14c2
         WWpzrzmP7tokR0RmO0U0n0q4za2aX0LTC0tBYJQxTBAarp/r7ERqbWV4s3c2qTruWIk9
         qmJq6gTDlQJLlIv/DUbD3hmBTq1LQEHde8qqrtTTLyZCFOEL2vLnNBWDE1j4PTHXKe+r
         M/qvlI3JPrI5wWg7R31tDj/rrVQHwSe75ZchpU/IRq3/W7W1V3/baMVjn7IEr4mgt2FF
         Rmm3gUrmUNW64bLgnCEii+j7k9LJRi0NyqWyIpJlvbXilYIrQ6KemrFALiiLGENrD9Dv
         Kpfg==
X-Gm-Message-State: AOJu0Yz+6+OYi1e7CZvcMNu+XdFcnXkPAUyBkZSqIqLqqozilqgRVn7U
	AgZTHDIDj9fLWua33MaWwg0=
X-Google-Smtp-Source: AGHT+IEgltA1FLRJxQhWjaa9BeqgTtpLsLuC4QWr8Fg4O24OQw9fesORx07JhM+EoIyLCAgsamJalw==
X-Received: by 2002:a05:6a20:729e:b0:18b:826e:e611 with SMTP id o30-20020a056a20729e00b0018b826ee611mr468528pzk.40.1700763807071;
        Thu, 23 Nov 2023 10:23:27 -0800 (PST)
Received: from localhost (dhcp-72-253-202-210.hawaiiantel.net. [72.253.202.210])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001b896686c78sm1649287plb.66.2023.11.23.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:23:26 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Thu, 23 Nov 2023 08:23:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: linux-next: manual merge of the cgroup tree with the workqueues
 tree
Message-ID: <ZV-YnVfdeU9NJWJw@slm.duckdns.org>
References: <20231123122644.34518972@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123122644.34518972@canb.auug.org.au>

Hello, Stephen.

On Thu, Nov 23, 2023 at 12:26:44PM +1100, Stephen Rothwell wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry about that. I resolved that in cgroup/for-6.8 yesterday but forgot
push it out. It's the same resolution and published through cgroup/for-next
now.

Thanks.

-- 
tejun

