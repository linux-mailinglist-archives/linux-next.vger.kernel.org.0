Return-Path: <linux-next+bounces-3259-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786094B5BE
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 06:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E545E1F22D41
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 04:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07667E792;
	Thu,  8 Aug 2024 04:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="V2wEDoT1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F892E419
	for <linux-next@vger.kernel.org>; Thu,  8 Aug 2024 04:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723090029; cv=none; b=spUvkB95IhWymryDyBnTf/THAlRtoMjt6QJ1zTfs26uy530gQ+F+IniKrZYPUMoKpMjKnpbKRj6oaIQhtid9zMlDmOqva5DxTTpAOmhvnjm9bUiwlpKeCHjytgH9ip5hE9IPAophtjpi40sUULmnsekfQyBfixgnKd7wNj8m8UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723090029; c=relaxed/simple;
	bh=o6mZ+XFuDcchuwZNU7eQbylS4WywOQo4PxleCE7mo6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDuvcPwkKk0Z1tYrqW1s5egz8B2460RniyZNGcmpvVPOvcOVaX54/gCtizYzvP2BYNWrvkSZq21JH7YXlrp0jPV6b7c+HfDKW0E6g3XN08O0XP9bhz6tmD8BXCORHxN8YOOk5pCQyTV1Xh/RdbxxUTPAIQTTn1v/PTZznZAblEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=V2wEDoT1; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-447d6edc6b1so3184231cf.0
        for <linux-next@vger.kernel.org>; Wed, 07 Aug 2024 21:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1723090027; x=1723694827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GSPLPHttL16sT6tQners2xK8hI4QMogUGmK36uWxcY=;
        b=V2wEDoT1qMcrKQkuLaE8LmYFBz9X1Ux/NXLwH6oBFWWDhLGY1N9z3COvXLJJSdJ6gr
         tBVyyZRko+lo1nK/sJFTHQHBt4kZ0zyj5mnCdAnEdVPCEQ20uKjnlgrzHWnakwTFHYMe
         aGjf86K1GECdjxigN5mVsrq73Lrenlgsv1t4KSWkUz+DieM/qqZHsKV1gODZ+ghcpq14
         KLI2QqJEthDan9b0T9PcKsP12renx3CCpO1UjKvq/QVUt5hgbuVEtOPehdh62Ghsa6OE
         j2iYCBdGvSNm0X5FVx1aA5fxyOTfTWwXsOzBlQBeINzEn0OewSwJqyE65Eh9HOeB76RO
         PfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723090027; x=1723694827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GSPLPHttL16sT6tQners2xK8hI4QMogUGmK36uWxcY=;
        b=u8lYkN92ZI7bK+LzSBtsrY7qJE0fcfOXGI9kEMUHdfO4eowiA1ZbTrdwRM1bNWBGki
         2eZMG/k7FtKgNAmbjoaaqTcpbAXLCENcyIMSPpziE07XzIeNX/nFsiqX2MUSI46hMBVi
         D7g9/sOdE9HbuGp9C1im+tu5BGkETIbTV7wtM0Y4xNWfaosiYXN7AfMq8/YPGfQ87gcU
         /T5hgCcIwI66EMzXGAmTJD9wlsbwr7b10MJPfNJMuEPbzeqT7YtNrcQmqsoDPQ+nWMA6
         +zzcStMSci/cYpMBrPM+BFnQN1VOAUUcIjigvTzxuoowwKqOldWOJgmmdRiTnfKj+fOJ
         Y0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWf3SNztcL5xHC3hLhHYBqjsenKkIyEUAtZOtngUADt4jCgY06v851MELllDgvDnHZp1co3uJDlxGXkBLz1MXE7IX4jykMZr8bMew==
X-Gm-Message-State: AOJu0YwuqOsVOL3pGcMNiz08wESgWplYQhlSuhj/g8RmCXXy3nMO5diw
	uWMB7jC9nkJZqmoDH90R2FElU9YwyrZOP5o1kKKeO5gmcXNpCq0zhMqmGZihyog53UfjUkUUE0S
	vUo3D0wYYAGc9ICJWpaq7uHe1VRsw3YUn/2eVC1MzwEqX+CUL+7w=
X-Google-Smtp-Source: AGHT+IEdpBZquXxDF0TfOERvkZ7eml1/CCIW5IAcvi73rGjE9dkM735b2Uo3Qkrxcfns8UqQwuri2e+EZlVjzbCL6Ik=
X-Received: by 2002:ac8:774c:0:b0:451:d541:8b77 with SMTP id
 d75a77b69052e-451d5418c1cmr4374881cf.46.1723090027131; Wed, 07 Aug 2024
 21:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808135815.5e3f50b3@canb.auug.org.au>
In-Reply-To: <20240808135815.5e3f50b3@canb.auug.org.au>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 8 Aug 2024 00:06:29 -0400
Message-ID: <CA+CK2bDs150AbtnJcj5AWkMEtKR_AzY_hjzgscXmBj+yQzpEZw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mm-hotfixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 11:58=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mm-hotfixes tree, today's linux-next build (htmldocs)
> produced this warning:
>
> mm/memory_hotplug.c:575: warning: Function parameter or struct member 'ni=
d' not described in '__remove_pages'
>
> Introduced by commit
>
>   ff4440b02821 ("mm: keep nid around during hot-remove")

This patch has been superseded by a new version:
https://lore.kernel.org/linux-mm/20240730150158.832783-4-pasha.tatashin@sol=
een.com

We do not add nid to __remove_pages() anymore.

Pasha

>
> --
> Cheers,
> Stephen Rothwell

