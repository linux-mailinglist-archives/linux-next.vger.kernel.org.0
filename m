Return-Path: <linux-next+bounces-1023-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A475384B6BB
	for <lists+linux-next@lfdr.de>; Tue,  6 Feb 2024 14:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70551C2480E
	for <lists+linux-next@lfdr.de>; Tue,  6 Feb 2024 13:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFB1131E39;
	Tue,  6 Feb 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRcZ7Qtm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D6131E32;
	Tue,  6 Feb 2024 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707226910; cv=none; b=gLJ0nB0Ya4MkiuSr5A+G8lEo3GD+izz74aHh7wPec/OqUeWBuz2Uh2DTjaDjWXkmMjupZp/ig3DvgOoGkmqO9g9ngzESLDYk/6t8Kt1kZ9LQr1T32p3Ytkcss77LUi0mQqzR0rD23PW3IAkuz3HEIp4PAMlAee3zST2YPCiyK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707226910; c=relaxed/simple;
	bh=rijJprixsoGa1LEszPiuReprOlb3xU0SeTQMJIfqyYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl4J+GBQ7vtAp9EZJk2ktwILMLxVcmCMIKM4hlQy0xj3DRvObee2WEseiN9j/DKC9VHvb7Dce9WdyTb/vABj55ZhiblHlECzYM7GKCz52qF2h7UGlrs2k0+GnHOdDozkAdgmPy/DlXc+8Frf6uWhJKivG+vtop7fNenV9aVucAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRcZ7Qtm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE6EC433C7;
	Tue,  6 Feb 2024 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707226909;
	bh=rijJprixsoGa1LEszPiuReprOlb3xU0SeTQMJIfqyYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRcZ7QtmpJG6Ehmg0NLkY8PI/2FobmeD+jljY4r6JXS855u+EN0yWHn6uTojN+LjS
	 LjROsnPNfDRLBivjBOIOpLM5NsbaA5n5WZcVXTSIFF/N0q0vDu0F3s/RHYfXce9B+0
	 uhfHRAgogtuX5+NGpyKL07/Z7TdFK+bIyhxmaIHJqWP9vcbVTKpNJyT+Gu5iupBkqq
	 nsmbw7fpPz5kC8R4X+MJCGb+lSMgjEfungB4ia/JEIFBm1lqAUsgWQDdonbEt44dK9
	 PCqah0nV3cqr+0koRiWQ5MHmcVSMbRG7brN20Vr8ci2TWqsB3UGljzyBWSza0kpx7i
	 /1wCrBxbfA3iA==
Date: Tue, 6 Feb 2024 14:41:43 +0100
From: Christian Brauner <brauner@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Jan Kara <jack@suse.cz>, linux-block <linux-block@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next: /dev/root: Can't open blockdev
Message-ID: <20240206-ahnen-abnahmen-73999e173927@brauner>
References: <CA+G9fYttTwsbFuVq10igbSvP5xC6bf_XijM=mpUqrJV=uvUirQ@mail.gmail.com>
 <20240206101529.orwe3ofwwcaghqvz@quack3>
 <CA+G9fYup=QzTAhV2Bh_p8tujUGYNzGYKBHXkcW7jhhG6QFUo_g@mail.gmail.com>
 <20240206122857.svm2ptz2hsvk4sco@quack3>
 <CA+G9fYvKfeRHfY3d_Df+9V+4tE_ZcvMGVJ-acewmgfjxb1qtpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+G9fYvKfeRHfY3d_Df+9V+4tE_ZcvMGVJ-acewmgfjxb1qtpg@mail.gmail.com>

> As per Anders bisection results the first bad commit pointing to
>    ba858e55b205 ("bdev: open block device as files")

On it.

