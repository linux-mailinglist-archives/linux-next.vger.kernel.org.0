Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8802D4293
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 14:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731842AbgLINC3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 08:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbgLINC2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 08:02:28 -0500
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F0CC0613D6;
        Wed,  9 Dec 2020 05:01:48 -0800 (PST)
Received: by nautica.notk.org (Postfix, from userid 1001)
        id 3A276C009; Wed,  9 Dec 2020 14:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1607518905; bh=/h0UX5qvT3QiTtVrnpfllmfaY7JyyIHheAMuZwPKz1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R/v8Ftat3vAcPDSN391u4gIMklEx0ffUIyJBf0Z6np8I5yltLvlFiBNtA2uggbCqm
         w1z7v1gfXiNiovAg5srypOGgzOL4DiIRYiwnEh0ZXF9DA2U/40SsGKA5LixOtC2BLs
         GrOa6JUc8GvmujZys7laWahWQkOOq70TYPwKr6WOmt2my7hN0Fdy9XM36HuFp4Nfe5
         1eq0yT5ekjDAB2sSFCj0FulngLnAcTgwPjoeavKy2aFsV14WI+UStcQu0gfmJ68/KH
         ZLR8Da2oBNyDnb1h1cVESLoX5lQk9264FPQcGHNi8NzEuP1/zURoOEEMLiR5R6yR52
         O3G03VepetxRQ==
Date:   Wed, 9 Dec 2020 14:01:30 +0100
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Message-ID: <20201209130130.GA15469@nautica>
References: <20201209203029.7f2a8db2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201209203029.7f2a8db2@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell wrote on Wed, Dec 09, 2020:
> After merging the kbuild tree, today's linux-next build (x86_64
> modules_install) produced this warning:
> 
> Warning: 'make modules_install' requires depmod. Please install it.
> This is probably in the kmod package.
> 
> Introduced by commit
> 
>   330029209513 ("kbuild: don't hardcode depmod path")
> 
> Unfortunately for most of us (?), /sbin is not in our PATH ...

d'oh.

Now you say this, I always found stupid distros that don't include sbin
in user PATHs: utilities like ip and a few others are perfectly useable
as reglar users to query the system state and the first thing I always
do is to add /sbin to my path on the rare distros that do this
(debian-based distros only?) so it totally slipped out of my head :/


I guess it's possible to make kbuild check both sbin and PATH, would
that be acceptable?

I'll have a look at how to do that if so.
-- 
Dominique

