Return-Path: <linux-next+bounces-6422-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6CCA9F43F
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 17:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 119013AD22D
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 15:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D010C1FCF41;
	Mon, 28 Apr 2025 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqLSa4iZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC46149C64;
	Mon, 28 Apr 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853527; cv=none; b=qqsRhataGg2rbYLkaTinf6Q1FCtFxiMYCL9ek8WdxK4eau3nyEqr07D8tG9EZmBQ2zTq5LpJ8cui8jyLBbkGnKQ0JA/RW3JKpYXz5zefoOYVElm3+kR1/ZzsTW+bpIkBkLI0akRgyNpBTucmy5BvcW6UEHrsuJTbK34IYaaYsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853527; c=relaxed/simple;
	bh=S5kZANsls9MU1jQapT7zNFbxF7EWA8i0Z3uUdx0AWh4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9UCXfgifcamS81RV8moj+Hd7DRa/VyZ01oAut6CvIEET7FrCdzdipxw8i2GHRXLEbZtq2IKWS+sIMwoAyi3UKBV0YaA2zklYCQIethlcJAvcUX1x5qdCPGm/FrMf65PvKtpJnh6staXP6+dJwKSqaWk8ZBE7GZCbO1CiLFhiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqLSa4iZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3105ef2a071so48617411fa.1;
        Mon, 28 Apr 2025 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745853523; x=1746458323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O5KI4iCYzUE4mcEDBVLQLUdVyhSyVSWFm4H2BuphI+Y=;
        b=kqLSa4iZr3+PwjwqWq2ATZZHQ6wvsUImIKSWKfBUBUhTmd/KDozKMcO1NA7wYG4Cz1
         idCwHGr1HClgLoxEoTTu4BU+OOH5OzmovP6IlViigbNZ3JllHxY2qai6DeQOBFpR8iXi
         2kb6VkV/869Ao8/dDICUAALZnJgAFLkW55El83hmGxVZ/wgDNdH3WfAt9owUEBqUMtL/
         axzTWXeIyvqWiMKYA5S0ZD8ZUbA/lScAIhqMaGRmM/J/F5EgSrcapJfBwCqg0HvKVuDA
         VhpJ2P+xS97xwGReG1cHaDoDfZh1cs6t2whXj6wgxlsFrHeY8AfQSUEHo17ZW0riJGis
         CzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745853523; x=1746458323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5KI4iCYzUE4mcEDBVLQLUdVyhSyVSWFm4H2BuphI+Y=;
        b=j04blJrilr2XrIEPfHvHncTI2DPtsjFAKsGvPkUODjiPUqt3slSOfY4j6Y+7RnyCu1
         l2bRZatz2VfF8d4h68RB6XFZbWX0gAth6Z3v3IfIP3eBIS/QgO/48auycvLmwFGyTqgH
         nlJYEtilu8vQXV3fWbAVeHzbEqJQRnnowzxdEG63cftYbnpSjNpA1vy3IRWKhxCMcoqJ
         3OKp4JvZ++MVEx2Yx+1Oi8V/Vsy4y/R/E/kw/b/JuT96XufFvqLk0PmjCHF1TqR+Xb+F
         +h9junJlxWbCqXW53A8Lu8FEzOAtSN5H7d2JlO8mvM/GcyOVMksZKnSvUBuQmAHQs41Z
         yiXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0QNHxJE3kdWGbbdt2yysCim1/fbflJxZImkY1995kw1PgYX9QZA7k1VFfCUZKefAYQa5mn3yNVqquNA==@vger.kernel.org, AJvYcCVvy+MuABVk7IE2Ugbilu8+wTA+hfJ2CWiSPIDELP6CzoqSO4hXaIKyD1upY+JYnJ9XKbMnsY1oRJG39jI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0BVqbxNuKsk2dcCvQGa0i9IWgFjfxlBgy9DptjNA8Hr/Xra49
	eE7W6ZKwnv2/HaWLewa37Xt6YzoPqlbyE9BiDdp6aW2kj+zSpTB8/ym8EPFs
X-Gm-Gg: ASbGncsIJdn4+A5v114CHLwYZMVb+EIZ8n9pvcV5zpNFKf+8ITgmGazOvWysdHxoprj
	hjJXxUIo3KR7ByfDvWlc+zq0RO04ryjJoAxCt3LaC9p44A+pKnBNf7Oy8TRGXtE/fq9jtcPkKA9
	6L5OxruWWPK6NkpHoT3KFeLoBFzRxKZkhHRmlL2F+a4Ws4wufRv3uK8IfQgXzc74sDqE4cu6vAv
	3ZaIZd9fDxeeD+gHjm5eRvyNk/l3sgd+nK11JWxqfiGoruDTnmTSkzA+mpCLbCjUgSfrHeCCIIP
	11eRL/7S11SEBp29f8fqmj96Xy5j1W/pQbR+njrFMXBY690zZvA9HSNO9mq/iYiR99loGhHO/E/
	QEXs=
X-Google-Smtp-Source: AGHT+IFH9kBa3gbYhE+I/QfTW2KgG031/GHYhbw2sykrAzVlr2hwLhgjIl2l51QIZCAFm/Sbh6U1nQ==
X-Received: by 2002:a2e:b888:0:b0:310:85ba:115f with SMTP id 38308e7fff4ca-319ddd667c7mr37026941fa.33.1745853522855;
        Mon, 28 Apr 2025 08:18:42 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659c4fsm21262841fa.21.2025.04.28.08.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:18:42 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 28 Apr 2025 17:18:40 +0200
To: Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>
Subject: Re: linux-next: duplicate patch in the paulmck tree
Message-ID: <aA-cUPL6NZEms1ZY@pc636>
References: <20250428175438.0209858e@canb.auug.org.au>
 <aA-RAjmhvIbI_z9b@Mac.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA-RAjmhvIbI_z9b@Mac.home>

On Mon, Apr 28, 2025 at 07:30:26AM -0700, Boqun Feng wrote:
> [Cc Joel]
> 
> On Mon, Apr 28, 2025 at 06:08:45PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commit is also in the rcu tree as a different commit
> > (but the same patch):
> > 
> >   5c9e0062989e ("tools/memory-model/Documentation: Fix SRCU section in explanation.txt")
> > 
> > This is commit
> > 
> >   8e40035aab95 ("tools/memory-model/Documentation: Fix SRCU section in explanation.txt")
> > 
> > in the rcu tree.
> > 
> 
> @Joel, should we drop this commit from rcu?
> 
IMO, it should be dropped from the RCU tree as soon as it is from
another kernel part.

Paul was about to deliver this via another track. But it can be that
plans have been changed.

--
Uladzislau Rezki

