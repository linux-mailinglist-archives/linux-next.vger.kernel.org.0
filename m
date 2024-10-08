Return-Path: <linux-next+bounces-4142-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE2994480
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 11:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D4DCB22E1E
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 09:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35FB18308A;
	Tue,  8 Oct 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b="UpYzFhen"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D970013AA4E
	for <linux-next@vger.kernel.org>; Tue,  8 Oct 2024 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728380514; cv=none; b=s0v8MGIPScWzZzy1mmCscXdkXtBMP2cbpTXicZHkM32mAbe3WI+yO2OI2QfpunDfg/yNYnUsoAGov+UkuW2KKJ5a8e7ehntyQ2j7TRnDrNssRknfc2tJaB+qfwxcZCfSyU6kpCxJenNnMWaAVjA+n7UUpthfXbQd3uhmVljbuhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728380514; c=relaxed/simple;
	bh=Mo2e9NcdYS31B/vIw3xECB9NV30Pu2FvtUdn6fYteX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVEh09nRzSbAoYLr5G8iUaGyb0XN36C0jUTN2hRSC+PACbkU/hkcTW3KHYEr3UZwPy8BS9r92N0RmK9SVoktcUBVQYaKjMGSr1fGCXRBdn26wgBEdGMkn3vzQVMoc8hOaS5bQslwCP6rAZEFsw51zlJDmMdoU9K8NShDiq4d7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in; spf=pass smtp.mailfrom=iiitd.ac.in; dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b=UpYzFhen; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ea24595bccso142596a12.2
        for <linux-next@vger.kernel.org>; Tue, 08 Oct 2024 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1728380511; x=1728985311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0nlWa2ec/d6j0ayZKA64vJRenf3pukJl1StuKCsSzE=;
        b=UpYzFhenOV96QdrzTVBexAZ1uNW4bIsI/ioF1STQxBxKezKu3FCMOnNimpeATPAhpA
         UzVnNXTfzCY+RY82/IJVEceta+OO+zaPM9DJJeERTkrLVGO5+ZJpQAQR0J7/qNJ3SK9J
         xQlfH3XjXRIUkxZy+EnmozN/KC0yFIWHib8mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728380511; x=1728985311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0nlWa2ec/d6j0ayZKA64vJRenf3pukJl1StuKCsSzE=;
        b=LCoUJtgaRiHpwlNoQ4HNluGm6HDlj3vSfVpwFEmmuAhH5wHFXe74PUN2jZotBSGCQ1
         /zgMudmMONqJglsEplVCk5lPMitUnpy+UeYTT+QiO0dTrgEw4ctEICxd1cltFqWXsyfz
         PstyNZas9UtgnKtZ0h7wtHUJueE1t964s96kSR47SQwvQaMdOZ5f91TqVgtHaQJKnRrl
         5d8YfllNXSCq+tYVo1Int0DR3XDSv5kwQB7ihua2bJSGGngx12qRcs6G7ViYtZOzl/SV
         h+f1s5s0220E2PKt67qCy6BKq1CpIFt5Ru0afOe8hhRQWmFmBukOUU6HLMlr9ySyWDWO
         jbPg==
X-Forwarded-Encrypted: i=1; AJvYcCW3ow3yf3asoQcq/LvQPPgJFhpgOBpha+unJY5sJeLutOk3zcRtUcDsHGmUzp/JpMPD7l5TGwFf7CbK@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrEhoNMIMyPtntTGkKXJOcZeZHzol6Qf/irzrt+8LO9hOx1NP
	Sf9snk1P5p+3gUDZp4u6v36JniY0L8Yclbt7aVmzqctstPcNu7mG8UctIye4adk=
X-Google-Smtp-Source: AGHT+IHf0bVYhdGwPLwPXuj7BNLWoONxtuBYeGxYm25ifrcUMzWiS6UprDQ5Dxhaf8AHR6liCx6HXg==
X-Received: by 2002:a05:6a20:438c:b0:1d6:2378:58ea with SMTP id adf61e73a8af0-1d6df73047emr22517140637.0.1728380511096;
        Tue, 08 Oct 2024 02:41:51 -0700 (PDT)
Received: from fedora ([103.3.204.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13968d98sm52088485ad.184.2024.10.08.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:41:50 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:11:45 +0530
From: Manas <manas18244@iiitd.ac.in>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the mm-hotfixes
 tree
Message-ID: <5y2aqwtuqyrfze6mrinnynhrbfrjtd5bsu6yb7quyzr6lqknd4@qiyaxleyj2ax>
References: <20241008074720.1a18a325@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241008074720.1a18a325@canb.auug.org.au>

On 08.10.2024 07:47, Stephen Rothwell wrote:
>Hi all,
>
>Commit
>
>  922e46ae7737 ("mm: fix null pointer dereference in pfnmap_lockdep_assert")
>
>is missing a Signed-off-by from its author.
>
Hi all, I am the author of this patch. I forgot to sign it. Should I send a new
patch version to amend the mistake?

Sorry, I am new to kernel development.

-- 
Manas

