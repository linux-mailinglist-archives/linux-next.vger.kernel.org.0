Return-Path: <linux-next+bounces-2975-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264092FAD4
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 15:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E027B281642
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E1516F8FE;
	Fri, 12 Jul 2024 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="2hUULr+3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O/KM6A/6"
X-Original-To: linux-next@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F6A16FF5F;
	Fri, 12 Jul 2024 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720789228; cv=none; b=hRlfx9bkdD4H/kveJ+sZPAp9Uxpc+dEOSkMEmNSp5Yfi636OKhm1Jf/IemJ1nztOlBBviZ6Vmk3gJMBivYa/wq4IIjiQ4jlE1IOl+hA6TdciBYz1236nOmGBS5aepu1k1Ea35MxY7zcpjKtSPiZ8lU1HR6v/EaknNtrDnpHVqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720789228; c=relaxed/simple;
	bh=3Caa9i6rxgEInURErL47jrOZK01wi/gcnCNnCEkyS2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ellI+4CM5yRwx4xtf7jsEnfTCViUbms5YqNTGujUl0J+0ZlA53kVgIbULjpNNNLjdmsZ/7jr8v7LkFj7k9gGlNqfPTdWIhUEbPmCvr8a9q9Oq+KVGsPntjaRwmeT/4Pq6z/jMdApGijpTXRN9bsR1VHnwokFos3wf5RRAKEqAzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=2hUULr+3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O/KM6A/6; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6E00B1388718;
	Fri, 12 Jul 2024 09:00:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 12 Jul 2024 09:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720789225; x=1720875625; bh=3GDpwNPGzb
	vmC/FwaIqYjMRc2Nt8+PK5dONnWjiwXEg=; b=2hUULr+38ocdOiBK1WZnhr+4iv
	9EdpsIXGD9ahmL7C8M9YiPERzwFuW+9lrI6Qi1eukpz6qLzzbYfrBkKioy9gA2/P
	xKsMhoyTmeIg80PyCt5zqgVJs/wKbMzwNfV2/opzYl8louFhO1HqAO93cwHRnp6x
	ECD8SqMVgKrfGVlk/rHpkC7Ci5QWSsW6F1X219rAUzunvVEh9yaY8+eGioJYW0/1
	3PKOBwsTTXSPNkTPWl2zKaM70xcU2TRdc2dtGYqvUMs8OodJZMaRaBxMd2wP1gA0
	v2SlmSfJrfMF4ZG6Vufu7KgFIEbXmmUA9TgsPsTli5hch9sd8cBetKvPqiPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720789225; x=1720875625; bh=3GDpwNPGzbvmC/FwaIqYjMRc2Nt8
	+PK5dONnWjiwXEg=; b=O/KM6A/6QgNvquZ6L1KmR766RwywPNC8rF05xHCrOzhl
	Zgig0yAfw2BkU7FiPDkENC323ePNEGaR313DSILtUSkAo+JH8l77g9LoYUu+y7YR
	q6WWrxxDWbOUeakbkZrIYlwbwblz6BOOfg9mW4t37scGmuhSLfiJ7XYDJlU+j9ZK
	wa1L1LPTX6IeHKEJMhk1Ku2jrQPTZfM/sO2GiBmnIUm1A8AeM5XSFVmmN+rD7WMi
	zYyWR9QAJvUI1tZypvKYhB9PT9ZJXQjxjl7OiQami9uonneP8INzU6r863ksx7EK
	Bk139xqpdPola80FgF2hsmAJQgWDPstWGR1tte7JQQ==
X-ME-Sender: <xms:5yiRZjbFHeOUXcwVtKGj560x8ykGvF1fiMn6kRkvCRV2zUCaUa96VA>
    <xme:5yiRZiaYmVzF9AVX9Gr4rJg20ggFw9D7pgM5KaT3cMHm-4KZTIKWZ4kadVqna3neK
    IK8KTjI6u2FzQ>
X-ME-Received: <xmr:5yiRZl9EgJpq8F2dO_hZPpsEJ0l9EJMfGs6UylNqAC245yd_ZZq0daVJRczGNGblAAhtW5Yrnpdl3SJZi7DbF2waE7isE_G1xH_NcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:5yiRZprigbToEDWBt8n5MTNCVBekqFwEBwJZzqxTziOohL8uhce-JA>
    <xmx:5yiRZuqbHzsE17P_Mgau2AbSaID8H8mLEbtOxaOHjJxcvDi_lm64xA>
    <xmx:5yiRZvQ6KLs4hOOBEcVv72PAn-43x2ovrre3Lm6w8QC1N_dAhYcnQg>
    <xmx:5yiRZmrjpTiW9dQA0pwCW8x7c2y2LuxpF_BgOAVCp6u9463XvK89uQ>
    <xmx:6SiRZrj8rDjo7phBfT7H_PA7IK0E_M95FjafI9nMS_vhnKcLwqeQe7J1>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jul 2024 09:00:22 -0400 (EDT)
Date: Fri, 12 Jul 2024 15:00:20 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vamsi Attunuru <vattunuru@marvell.com>
Subject: Re: linux-next: unexpected file added by the char-misc tree
Message-ID: <2024071202-monogamy-retake-0b78@gregkh>
References: <20240712224438.2d6e0cf6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712224438.2d6e0cf6@canb.auug.org.au>

On Fri, Jul 12, 2024 at 10:44:38PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   5f67eef6dff3 ("misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative driver")
> 
> added this unexpected file:
> 
>   drivers/misc/Makefile.rej

Ugh, my fault, that's what I get for applying patches with fuzz :(

I'll go drop it, thanks!

greg k-h

