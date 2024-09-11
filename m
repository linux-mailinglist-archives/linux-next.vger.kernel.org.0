Return-Path: <linux-next+bounces-3752-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE9974ED2
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 11:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13752B29D46
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 09:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B6E185954;
	Wed, 11 Sep 2024 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnEdk+4g"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710CE155346;
	Wed, 11 Sep 2024 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726047537; cv=none; b=n7y7xk44vW3cLkU4n9lKvwTlQddPczwpt+d1QE9sQMytdosgb5NXqMGu0Ksx1QdY52+yc/21kbF2lNLOwuyz+hh3NZcysMD7oeB7ebZK8fO/ohKSjce1UVWvofZY++azcvp1bhGL4U3OJzds0xD+/Qg6YSqyqCe0D/CyeoeilKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726047537; c=relaxed/simple;
	bh=TXTCVGDJlbNno9ttEPj7rnDWQWoN8w2hVYVp7GKrmpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOn6HIyU/IIu+5ZTn608y/SkM5UdPLunKVf3qMkeWIKjV0vvAWE3PCsuUeGJBzWe4//dlJKvXTNU9EYiw8NyUASa3GY5w7vjFzOOJoXDIIVmeBrcQX3QIyQ+G0aMl7IL0NAoiTs3N8FkljzBO+TmMafxqS/PcOUQdyD3JbWb7Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnEdk+4g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CDCC4AF09;
	Wed, 11 Sep 2024 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726047536;
	bh=TXTCVGDJlbNno9ttEPj7rnDWQWoN8w2hVYVp7GKrmpQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lnEdk+4gATmDRncybiDX+GlZDf6d1P/2OjdW4KL7Mi94c1VswTTla1iN/rPbwxhSX
	 WnQn6jjWTpTpS03nOJfpNdTchXsuYAHTAjOGf9TMW2s/an8F8mTkBg2NUACVEXR9gw
	 WCK8xIENWpmeTqC9jRaEUbiEjuD3fRJEcbbHOcEpDd7Ba8ZUKO3bH6Kgu4vKI9XAjr
	 L3v/cs6gTJYaWaTuOn3GPftl6bSmcupzzf1WaPBKBqKIZB+HONBTqtqR3C/uOiF6xD
	 UBdF0a6tarKdMwiBmnx0mYY9g+sQoe/AQ0ITjaHZOeZwWt0ehqfIj9Zg2vGaEFo2y/
	 FonKSrkomDvyg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f025b94e07so54178691fa.0;
        Wed, 11 Sep 2024 02:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSCQmPno5K9EBnvO+sT828UQ6qHbQ58+oI4PstLxjgc3Gi8sW8fkJ1MbcCSnCQIXwo1/HVN3imE31gCA==@vger.kernel.org, AJvYcCVsXVEJHqmtyFyZfJ4ItewRefZUJkvAJ4u7g4xLguabbH+nwt0tQ5vIlEpTRbKLLeEqPx9VkIm87NrG6xE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hmyNxam2wYVDfWAUukyh2IdG1+O+hGs5LimQ9TKEbByvkudT
	YqnPbcP2D/H/Mr8YU3WIo9RtTY99rneqUfNzM89xkQduIbhvG10xj8UPC5OJtuLQ0LxqdarkuHC
	k0COOdTj8yhl8MUcfsQsGkbR994o=
X-Google-Smtp-Source: AGHT+IFHpxvzWd6wRhm2DCrr3VlZDZfHcXgUn9OdPiMz/+f63jDlANSONY9jX99GUPY/z3kqiWRK6AG6IctYOm/ZQ84=
X-Received: by 2002:a05:651c:210a:b0:2f6:57b1:98b0 with SMTP id
 38308e7fff4ca-2f7524a31d6mr100279011fa.42.1726047535609; Wed, 11 Sep 2024
 02:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911101810.1d5dde08@canb.auug.org.au>
In-Reply-To: <20240911101810.1d5dde08@canb.auug.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Sep 2024 18:38:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLc=ik9QdX4K_XuN=cg+1VcUBk-y5EnQEtOG+qOWaY=Q@mail.gmail.com>
Message-ID: <CAK7LNASLc=ik9QdX4K_XuN=cg+1VcUBk-y5EnQEtOG+qOWaY=Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 9:18=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> make[3]: *** Deleting file 'modules.builtin.ranges'
> /bin/sh: 1: scripts/generate_builtin_ranges.awk: not found
> make[3]: *** [scripts/Makefile.vmlinux:47: modules.builtin.ranges] Error =
127
> make[2]: *** [Makefile:1157: vmlinux] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [Makefile:224: __sub-make] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> Command exited with non-zero status 2
>
> Caused by commit
>
>   04b15cdd611a ("kbuild: generate offset range data for builtin modules")
>
> I do not have gawk installed - I do have mawk installed (as awk).  Does
> this script actually need gawk, or will just plain awk suffice?
>
> I have installed gawk.
>


This is what I was worried about.

As Documentation/process/changes.rst was modified in that commit,
it specifically requires GNU AWK.

Anyway, you were able to fix the build error
by installing /usr/bin/gawk.

If a distro installs gawk somewhere else,
(/usr/local/bin/gawk, for example), it is a problem.
The shebang "#!/usr/bin/gawk -f" will not work.
"#!/usr/bin/env gawk -f" will not work either.

More people may start complaining about it.



--=20
Best Regards
Masahiro Yamada

