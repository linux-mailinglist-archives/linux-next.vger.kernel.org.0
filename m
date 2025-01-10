Return-Path: <linux-next+bounces-5154-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA400A09B84
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 20:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AAA27A4010
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 19:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848EF2063F7;
	Fri, 10 Jan 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IAeTFl8Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545F6216381
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535587; cv=none; b=PeRpdetlGu/IgC/ir+ZXz1udX7mcsH19IMoDtzm124lf6Q0zL7YoPvfMZLI2Pg3c0QacyJjdgwCUxRgUEBP3q4WBOr0z4wm49sO6VTU6uRvv1vH0BGbfEakjGZzi4T1kX6axWmpxTOFz9F+9TfVLUiGQy3wTBLdASElmb3l6xYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535587; c=relaxed/simple;
	bh=dlehFcQ9YspHH9+CUCnbN3ClYgZcNgYqKOAfOC6DADw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGT7h0qMJYQRPt3LPz4SkC1Wemi08krac9j1mA/zCrgIIzGq/j+ljL+do7+3s1sikDvEiQ4xAijlLiImPa5EFUbO8w0/Gx/cCHVa+y/f2Ip461rwbgPUdFiqKIq2JaUr/v2OwUryMvAUhq4VrODS1R6zs38SxaJmlMnN3dAGScw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IAeTFl8Z; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2165448243fso45775315ad.1
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 10:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736535585; x=1737140385; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GFbRxk1ae6/6Z81HaTcyFKc/JyiVeH17jz84RN8u9pE=;
        b=IAeTFl8ZxQwXqNaY+EppiEaFi4t2wi9Bo6VcNgReObratWiYfnM4K35op6wWLOQh+y
         gG78ZlQTgW+iFawKVbfzjyQq4kUjP50dIyjyVdmW6N0D/g1gKEM5/yMbJCiP86d8OD2/
         NYOZhg6MkGrU0bfurA50ExeJzJ9/C1zbmgN6fyF9amSiGyatNs/HA2VfMMceAhb+aebR
         UA3xt1T+XkcyGvft6QqOiUauzjJdxqV5+ygLNcFS8MYqI426He40tqFNyuR847G761Ht
         +Hzfbmk7zzS8VJrncUH2i5a3HoSFCGXfZph9RY4fDXzCDxZccWfIfEA9kGXy4M3MwXbX
         CUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535585; x=1737140385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFbRxk1ae6/6Z81HaTcyFKc/JyiVeH17jz84RN8u9pE=;
        b=Ml2gayE9lZ4qXRTcplc2+qn3GLBY6UvRy7WDjEvTZ6Gkvsl0oOOErZFqnDkKm1oVVX
         V4lwid7chFk0rpCnpQuEJ9/A71i+IbBNTotGseAgfxbOqOdlhBDAxVa6x8qEiHrBhk8J
         jvXTGqwJUJNOf1FffgaPl9vpHalf0/hlv80+4xuttnq/jMH88uGUqnCm+p2z43tbXGuS
         a9YKVu24NxjmAQgxpugSFnKm88v0jGl9Jrvdlcsz9e5/HXQlQwG8fFJcvnqf0hCFAx3D
         UeTvuO1C0/F0BUNGtLDxXHmX/QfnMFJhKEBnsJWzsjL1DGgNxn5qmqsuEDZ29cbPb6zX
         z1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/vMCgmiN1IjdtC6l97e8vVKOry3K7y1sw01k9qy0Xk7mYNnsYgVwOxkIUYsWbJ3Dly+VtHJAm9J49@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dWaAB76vNbQ2HtId2R8GSweBnX7Q4PoTtE3nerJ29oq/Q5z3
	/n6X4EsLyadFoWB36egk32iIsCYsZKvs72mLzVw4PE6jJkNa8Fh2lCg2WnhhNxI=
X-Gm-Gg: ASbGnctkX3nsNDRq45sCAwKQHPhhlfp/mcotBgDhxtftCI/3hb8lHtYEBGZUmZq/Xsn
	U6EHoV5jFsHT739x/P7SRcG99Kegn79gvGxqsbQrYqcqqbegcIvsd/YvVzKwbtH1NWIW9BuP9fN
	T/mU3ZPXDmk5oixBSrdl3Jyb97Jn89UEEv3QsGjG4V3JpRrcLl9GZSzTSvp+YnnFCORiFfPd9Le
	mV4rooFjRFuwiCEPwR/Ur4terprgtOfV9+86jQyNTGbq8bEI0JY
X-Google-Smtp-Source: AGHT+IGLo6poTf0JuA5FLmq0uu9dj47MkoR7b1Q1Vts3u5XioXpoLg+3Bx0PUGPb1Jgr7VfUS7eARQ==
X-Received: by 2002:a05:6a00:1c92:b0:725:e499:5b86 with SMTP id d2e1a72fcca58-72d21fdfc66mr17990618b3a.20.1736535584579;
        Fri, 10 Jan 2025 10:59:44 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4bc7:d274:c14b:fde8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a9433sm1870346b3a.176.2025.01.10.10.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:59:43 -0800 (PST)
Date: Fri, 10 Jan 2025 10:59:42 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <Z4FuHpL_EhpPG2Qf@ghost>
References: <20250110100505.78d81450@canb.auug.org.au>
 <Z4BcXhjzl066fNGe@ghost>
 <Z4EoUoxSYPnS_Hul@x1>
 <Z4FZr6RMikxo__nZ@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z4FZr6RMikxo__nZ@x1>

On Fri, Jan 10, 2025 at 02:32:31PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Jan 10, 2025 at 11:01:54AM -0300, Arnaldo Carvalho de Melo wrote:
> > On Thu, Jan 09, 2025 at 03:31:42PM -0800, Charlie Jenkins wrote:
> > > On Fri, Jan 10, 2025 at 10:05:05AM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > >=20
> > > > After merging the perf tree, today's linux-next build (native perf)
> > > > failed like this:
> linux-next: build failure after merge of the perf tree
> Some more:
>=20
> COLLECT_GCC=3Dmips-linux-gnu-gcc
> COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc-cross/mips-linux-gnu/14/lto-wrapper
> Target: mips-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion=3D'Debian 14.2.0-1=
' --with-bugurl=3Dfile:///usr/share/doc/gcc-14/README.Bugs --enable-languag=
es=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=3D/usr --with-gcc-majo=
r-version-only --program-suffix=3D-14 --enable-shared --enable-linker-build=
-id --libexecdir=3D/usr/libexec --without-included-gettext --enable-threads=
=3Dposix --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --enable-cloca=
le=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes --with-defa=
ult-libstdcxx-abi=3Dnew --enable-libstdcxx-backtrace --enable-gnu-unique-ob=
ject --disable-libitm --disable-libsanitizer --disable-libquadmath --disabl=
e-libquadmath-support --enable-plugin --enable-default-pie --with-system-zl=
ib --enable-libphobos-checking=3Drelease --without-target-system-zlib --ena=
ble-multiarch --disable-werror --enable-multilib --with-arch-32=3Dmips32r2 =
--with-fp-32=3Dxx --with-lxc1-sxc1=3Dno --enable-targets=3Dall --with-arch-=
64=3Dmips64r2 --enable-checking=3Drelease --build=3Dx86_64-linux-gnu --host=
=3Dx86_64-linux-gnu --target=3Dmips-linux-gnu --program-prefix=3Dmips-linux=
-gnu- --includedir=3D/usr/mips-linux-gnu/include --with-build-config=3Dboot=
strap-lto-lean --enable-link-serialization=3D3
> Thread model: posix
> Supported LTO compression algorithms: zlib zstd
> gcc version 14.2.0 (Debian 14.2.0-1)=20
> + make NO_LIBTRACEEVENT=3D1 ARCH=3Dmips CROSS_COMPILE=3Dmips-linux-gnu- E=
XTRA_CFLAGS=3D -C tools/perf O=3D/tmp/build/perf
> <SNIP>
>    /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mlinux-next: =
build failure after merge of the perf treeksyscalltbl  --abis common,64,n64=
 /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl /=
tmp/build/perf/arch/mips/include/generated/asm/syscalls_64.h
> /bin/sh: 1: /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksy=
scalltbl: not found
> make[2]: *** [/git/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:4=
3: /tmp/build/perf/arch/mips/include/generated/asm/syscalls_64.h] Error 127
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [Makefile.perf:286: sub-make] Error 2
> make: *** [Makefile:76: all] Error 2
> make: Leaving directory '/git/perf-6.13.0-rc2/tools/perf'
>=20
> -----------------------
>=20
> COLLECT_GCC=3Dmips64-linux-gnuabi64-gcc
> COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc-cross/mips64-linux-gnuabi64/14/lto=
-wrapper
> Target:linux-next: build failure after merge of the perf tree mips64-linu=
x-gnuabi64
> Configured with: ../src/configure -v --with-pkgversion=3D'Debian 14.2.0-1=
' --with-bugurl=3Dfile:///usr/share/doc/gcc-14/README.Bugs --enable-languag=
es=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=3D/usr --with-gcc-majo=
r-version-only --program-suffix=3D-14 --enable-shared --enable-linker-build=
-id --libexecdir=3D/usr/libexec --without-included-gettext --enable-threads=
=3Dposix --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --enable-cloca=
le=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes --with-defa=
ult-libstdcxx-abi=3Dnew --enable-libstdcxx-backtrace --enable-gnu-unique-ob=
ject --disable-libitm --disable-libsanitizer --disable-libquadmath --disabl=
e-libquadmath-support --enable-plugin --enable-default-pie --with-system-zl=
ib --enable-libphobos-checking=3Drelease --without-target-system-zlib --ena=
ble-multiarch --disable-werror --enable-multilib --with-mips-plt --with-arc=
h-64=3Dmips64r2 --enable-targets=3Dall --with-arch-32=3Dmips32r2 --with-fp-=
32=3Dxx --enable-checking=3Drelease --build=3Dx86_64-linux-gnu --host=3Dx86=
_64-linux-gnu --target=3Dmips64-linux-gnuabi64 --program-prefix=3Dmips64-li=
nux-gnuabi64- --includedir=3D/usr/mips64-linux-gnuabi64/include --with-buil=
d-config=3Dbootstrap-lto-lean --enable-link-serialization=3D3
> Thread model: posix
> Supported LTO compression algorithms: zlib zstd
> gcc version 14.2.0 (Debian 14.2.0-1)=20
> + make NO_LIBTRACEEVENT=3D1 ARCH=3Dmips CROSS_COMPILE=3Dmips64-linux-gnua=
bi64- EXTRA_CFLAGS=3D -C tools/perf O=3D/tmp/build/perf
> <SNIP>
>    /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksyscalltbl =
 --abis common,64,n64 /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/sysca=
lls/syscall_n64.tbl /tmp/build/perf/arch/mips/include/generated/asm/syscall=
s_64.h
> /bin/sh: 1: /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksy=
scalltbl: not found
> make[2]: *** [/git/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:4=
3: /tmp/build/perf/arch/mips/include/generated/asm/syscalls_64.h] Error 127
>=20
> -----------------------
>=20
> COLLECT_GCC=3Dmipsel-linux-gnu-gcc
> COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc-cross/mipsel-linux-gnu/14/lto-wrap=
per
> Target: mipsel-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion=3D'Debian 14.2.0-1=
' --with-bugurl=3Dfile:///usr/share/doc/gcc-14/README.Bugs --enable-languag=
es=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=3D/usr --with-gcc-majo=
r-version-only --program-suffix=3D-14 --enable-shared --enable-linker-build=
-id --libexecdir=3D/usr/libexec --without-included-gettext --enable-threads=
=3Dposix --libdir=3D/usr/lib --enable-nls --with-sysroot=3D/ --enable-cloca=
le=3Dgnu --enable-libstdcxx-debug --enable-libstdcxx-time=3Dyes --with-defa=
ult-libstdcxx-abi=3Dnew --enable-libstdcxx-backtrace --enable-gnu-unique-ob=
ject --disable-libitm --disable-libsanitizer --disable-libquadmath --disabl=
e-libquadmath-support --enable-plugin --enable-default-pie --with-system-zl=
ib --enable-libphobos-checking=3Drelease --without-target-system-zlib --ena=
ble-multiarch --disable-werror --enable-multilib --with-arch-32=3Dmips32r2 =
--with-fp-32=3Dxx --with-madd4=3Dno --with-lxc1-sxc1=3Dno --enable-targets=
=3Dall --with-arch-64=3Dmips64r2 --enable-checking=3Drelease --build=3Dx86_=
64-linux-gnu --host=3Dx86_64-linux-gnu --target=3Dmipsel-linux-gnu --progra=
m-prefix=3Dmipsel-linux-gnu- --includedir=3D/usr/mipsel-linux-gnu/include -=
-with-build-config=3Dbootstrap-lto-lean --enable-link-serialization=3D3
> Thread model: posix
> Supported LTO compression algorithms: zlib zstd
> gcc version 14.2.0 (Debian 14.2.0-1)=20
> + make NO_LIBTRACEEVENT=3D1 ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu-=
 EXTRA_CFLAGS=3D -C tools/perf O=3D/tmp/build/perf
> <SNIP>
>    /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksyscalltbl =
 --abis common,64,n64 /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/sysca=
lls/syscall_n64.tbl /tmp/build/perf/arch/mips/include/generated/asm/syscall=
s_64.h
> /bin/sh: 1: /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksy=
scalltbl: not found
> make[2]: *** [/git/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:4=
3: /tmp/build/perf/arch/mips/include/generated/asm/syscalls_64.h] Error 127

I missed removing the Makefile for mips in the patch. I'll send another
update. Thank you for testing this one. It looks like it is the only
architecture that I missed.

- Charlie


