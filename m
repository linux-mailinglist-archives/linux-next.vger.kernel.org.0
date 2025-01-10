Return-Path: <linux-next+bounces-5153-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD06A09891
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 18:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99AD188E405
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 17:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D49E212B17;
	Fri, 10 Jan 2025 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIOtWZTe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D092F3E;
	Fri, 10 Jan 2025 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530355; cv=none; b=K/Y9cSpbxtjc5byRtyfQon40S/uZUFKOlIolo57z5WFHJjoP+VSOeZfjf7YCT9hiwltd83RsSof/H6EBTDVouL1eCc4AOIoTk8MbEKRk3rtmas1qck9j8YS40mX6oDdBjOdN87YxhdTGGPhmv+FjxecOCuZSJHdj8Hw8iNX5t8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530355; c=relaxed/simple;
	bh=OlJNy7c62qCwKTUPtKRXyXqYchCXojv7KzNJlPQ4B/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrgTGXws0tHmhWcDwDqFmpn478Soo1/uC2/2jn8Ap58AkXMlZPqe6hVfSXbnf8pkwNT5I4oI/Ixc1ANPjRPxDsKFMJyGtmF0YpzoDoOFYvIn/MIu49r7kjfMG2UcwXboIunCYVRsHeYfuwJRzAupG5t0IULKINfbWwo+421j4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIOtWZTe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A70C4CED6;
	Fri, 10 Jan 2025 17:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530354;
	bh=OlJNy7c62qCwKTUPtKRXyXqYchCXojv7KzNJlPQ4B/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIOtWZTePYcrXkj6ELOTRqigz6SzT2jT/GhLjCzzmq2b42avwqoYpWVzkylZvoH4J
	 HXPMdqxEGCGOTvD36CQP5nI6PP3CbK60oaFhABZmE0TBOavCjQd9YOkVTxUBnd4X/8
	 ipKzQmdGJ2nUbpPQtM40iG4KSVBoPI3fcyQBdM2+4TJcUKkLnHdzPu7cnbtsrwgz6v
	 uzxsoX8CSzPc3sYgN1WKQ7zEGrgAnyMrIwtonssy6IViZuvdVigk3uxdXMZwdde8E8
	 wwYzLv9b/pHQEHK6tfQVPueYB8GNnXhaybfqJ2y4RRS+m/rNRTjtWMl6/YrR44wwov
	 m0m+VTiqf9tDA==
Date: Fri, 10 Jan 2025 14:32:31 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the perf tree
Message-ID: <Z4FZr6RMikxo__nZ@x1>
References: <20250110100505.78d81450@canb.auug.org.au>
 <Z4BcXhjzl066fNGe@ghost>
 <Z4EoUoxSYPnS_Hul@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z4EoUoxSYPnS_Hul@x1>

On Fri, Jan 10, 2025 at 11:01:54AM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Jan 09, 2025 at 03:31:42PM -0800, Charlie Jenkins wrote:
> > On Fri, Jan 10, 2025 at 10:05:05AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > After merging the perf tree, today's linux-next build (native perf)
> > > failed like this:

Some more:

COLLECT_GCC=3Dmips-linux-gnu-gcc
COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc-cross/mips-linux-gnu/14/lto-wrapper
Target: mips-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Debian 14.2.0-1' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-14/README.Bugs --enable-languages=
=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=3D/usr --with-gcc-major-=
version-only --program-suffix=3D-14 --enable-shared --enable-linker-build-i=
d --libexecdir=3D/usr/libexec --without-included-gettext --enable-threads=
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
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 14.2.0 (Debian 14.2.0-1)=20
+ make NO_LIBTRACEEVENT=3D1 ARCH=3Dmips CROSS_COMPILE=3Dmips-linux-gnu- EXT=
RA_CFLAGS=3D -C tools/perf O=3D/tmp/build/perf
<SNIP>
   /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksyscalltbl  -=
-abis common,64,n64 /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscall=
s/syscall_n64.tbl /tmp/build/perf/arch/mips/include/generated/asm/syscalls_=
64.h
/bin/sh: 1: /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksysc=
alltbl: not found
make[2]: *** [/git/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:43:=
 /tmp/build/perf/arch/mips/include/generated/asm/syscalls_64.h] Error 127
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile.perf:286: sub-make] Error 2
make: *** [Makefile:76: all] Error 2
make: Leaving directory '/git/perf-6.13.0-rc2/tools/perf'

-----------------------

COLLECT_GCC=3Dmips64-linux-gnuabi64-gcc
COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc-cross/mips64-linux-gnuabi64/14/lto-w=
rapper
Target: mips64-linux-gnuabi64
Configured with: ../src/configure -v --with-pkgversion=3D'Debian 14.2.0-1' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-14/README.Bugs --enable-languages=
=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=3D/usr --with-gcc-major-=
version-only --program-suffix=3D-14 --enable-shared --enable-linker-build-i=
d --libexecdir=3D/usr/libexec --without-included-gettext --enable-threads=
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
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 14.2.0 (Debian 14.2.0-1)=20
+ make NO_LIBTRACEEVENT=3D1 ARCH=3Dmips CROSS_COMPILE=3Dmips64-linux-gnuabi=
64- EXTRA_CFLAGS=3D -C tools/perf O=3D/tmp/build/perf
<SNIP>
   /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksyscalltbl  -=
-abis common,64,n64 /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscall=
s/syscall_n64.tbl /tmp/build/perf/arch/mips/include/generated/asm/syscalls_=
64.h
/bin/sh: 1: /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksysc=
alltbl: not found
make[2]: *** [/git/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:43:=
 /tmp/build/perf/arch/mips/include/generated/asm/syscalls_64.h] Error 127

-----------------------

COLLECT_GCC=3Dmipsel-linux-gnu-gcc
COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc-cross/mipsel-linux-gnu/14/lto-wrapper
Target: mipsel-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Debian 14.2.0-1' =
--with-bugurl=3Dfile:///usr/share/doc/gcc-14/README.Bugs --enable-languages=
=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=3D/usr --with-gcc-major-=
version-only --program-suffix=3D-14 --enable-shared --enable-linker-build-i=
d --libexecdir=3D/usr/libexec --without-included-gettext --enable-threads=
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
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 14.2.0 (Debian 14.2.0-1)=20
+ make NO_LIBTRACEEVENT=3D1 ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu- E=
XTRA_CFLAGS=3D -C tools/perf O=3D/tmp/build/perf
<SNIP>
   /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksyscalltbl  -=
-abis common,64,n64 /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscall=
s/syscall_n64.tbl /tmp/build/perf/arch/mips/include/generated/asm/syscalls_=
64.h
/bin/sh: 1: /git/perf-6.13.0-rc2/tools/perf/arch/mips/entry/syscalls/mksysc=
alltbl: not found
make[2]: *** [/git/perf-6.13.0-rc2/tools/perf/scripts/Makefile.syscalls:43:=
 /tmp/build/perf/arch/mips/include/generated/asm/syscalls_64.h] Error 127

