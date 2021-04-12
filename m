Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F4235B87F
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 04:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbhDLCWc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 22:22:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50175 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235857AbhDLCWc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Apr 2021 22:22:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJXYw1gksz9sVq;
        Mon, 12 Apr 2021 12:22:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618194133;
        bh=ayIvaJQH0Woyv4g17RCPUtqiLX70HEuG+RcFRW7RcZs=;
        h=Date:From:To:Cc:Subject:From;
        b=GJTv1IGsO4SBmeCgjfjuvW3iF6ViUncgAArKDCvledGOpiU2+uuyhCmaWIymdCta0
         qigzhkAzJjGVXIMxcriWce1zEJiBxH3RAfkEgs4eSGkoqjepZt5HsOimY5THtO6/Qq
         Uu+TyGHRKcgDXbfrXS1QmxepalqnfywYK+gJRH7YiWmsV8lq6tMEh7/8AwRRJ7NVFN
         LAL+sDFN8G/N85ofymJHFYJHA5c4lbKQEdonFuFRJ0nVPJgog0FP5Tfd8yJcvLR+Wm
         Y7/R8N6vJIRJBIIg4rPrzq63oAe/xyjStMCtcAl0QkES+3gEYahaPX+7PaIqBaksRd
         W+F9F4Izcccsg==
Date:   Mon, 12 Apr 2021 12:22:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the vfs tree with the xfs tree
Message-ID: <20210412122211.713ca71d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+0h8o+Tfh_0aLzsJvyln3zB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+0h8o+Tfh_0aLzsJvyln3zB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/xfs/xfs_ioctl.c

between commits:

  ceaf603c7024 ("xfs: move the di_projid field to struct xfs_inode")
  031474c28a3a ("xfs: move the di_extsize field to struct xfs_inode")
  b33ce57d3e61 ("xfs: move the di_cowextsize field to struct xfs_inode")
  4800887b4574 ("xfs: cleanup xfs_fill_fsxattr")
  ee7b83fd365e ("xfs: use a union for i_cowextsize and i_flushiter")
  db07349da2f5 ("xfs: move the di_flags field to struct xfs_inode")
  3e09ab8fdc4d ("xfs: move the di_flags2 field to struct xfs_inode")

from the xfs tree and commit:

  280cad4ac884 ("xfs: convert to fileattr")

from the vfs tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/xfs/xfs_ioctl.c
index 708b77341a70,bbda105a2ce5..000000000000
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@@ -1056,76 -1057,16 +1057,18 @@@ xfs_ioc_ag_geometry
  static void
  xfs_fill_fsxattr(
  	struct xfs_inode	*ip,
- 	bool			attr,
- 	struct fsxattr		*fa)
+ 	int			whichfork,
+ 	struct fileattr		*fa)
  {
 +	struct xfs_mount	*mp =3D ip->i_mount;
- 	struct xfs_ifork	*ifp =3D attr ? ip->i_afp : &ip->i_df;
+ 	struct xfs_ifork	*ifp =3D XFS_IFORK_PTR(ip, whichfork);
 =20
- 	simple_fill_fsxattr(fa, xfs_ip2xflags(ip));
+ 	fileattr_fill_xflags(fa, xfs_ip2xflags(ip));
 -	fa->fsx_extsize =3D ip->i_d.di_extsize << ip->i_mount->m_sb.sb_blocklog;
 -	fa->fsx_cowextsize =3D ip->i_d.di_cowextsize <<
 -			ip->i_mount->m_sb.sb_blocklog;
 -	fa->fsx_projid =3D ip->i_d.di_projid;
 +
 +	fa->fsx_extsize =3D XFS_FSB_TO_B(mp, ip->i_extsize);
 +	if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 +		fa->fsx_cowextsize =3D XFS_FSB_TO_B(mp, ip->i_cowextsize);
 +	fa->fsx_projid =3D ip->i_projid;
  	if (ifp && (ifp->if_flags & XFS_IFEXTENTS))
  		fa->fsx_nextents =3D xfs_iext_count(ifp);
  	else
@@@ -1212,10 -1167,10 +1169,10 @@@ static in
  xfs_ioctl_setattr_xflags(
  	struct xfs_trans	*tp,
  	struct xfs_inode	*ip,
- 	struct fsxattr		*fa)
+ 	struct fileattr		*fa)
  {
  	struct xfs_mount	*mp =3D ip->i_mount;
 -	uint64_t		di_flags2;
 +	uint64_t		i_flags2;
 =20
  	/* Can't change realtime flag if any extents are allocated. */
  	if ((ip->i_df.if_nextents || ip->i_delayed_blks) &&
@@@ -1348,8 -1289,11 +1291,11 @@@ xfs_ioctl_setattr_check_extsize
  	xfs_extlen_t		size;
  	xfs_fsblock_t		extsize_fsb;
 =20
+ 	if (!fa->fsx_valid)
+ 		return 0;
+=20
  	if (S_ISREG(VFS_I(ip)->i_mode) && ip->i_df.if_nextents &&
 -	    ((ip->i_d.di_extsize << mp->m_sb.sb_blocklog) !=3D fa->fsx_extsize))
 +	    ((ip->i_extsize << mp->m_sb.sb_blocklog) !=3D fa->fsx_extsize))
  		return -EINVAL;
 =20
  	if (fa->fsx_extsize =3D=3D 0)
@@@ -1520,18 -1476,18 +1478,19 @@@ xfs_fileattr_set
  	 * extent size hint should be set on the inode. If no extent size flags
  	 * are set on the inode then unconditionally clear the extent size hint.
  	 */
 -	if (ip->i_d.di_flags & (XFS_DIFLAG_EXTSIZE | XFS_DIFLAG_EXTSZINHERIT))
 -		ip->i_d.di_extsize =3D fa->fsx_extsize >> mp->m_sb.sb_blocklog;
 -	else
 -		ip->i_d.di_extsize =3D 0;
 -	if (xfs_sb_version_has_v3inode(&mp->m_sb) &&
 -	    (ip->i_d.di_flags2 & XFS_DIFLAG2_COWEXTSIZE))
 -		ip->i_d.di_cowextsize =3D fa->fsx_cowextsize >>
 -				mp->m_sb.sb_blocklog;
 +	if (ip->i_diflags & (XFS_DIFLAG_EXTSIZE | XFS_DIFLAG_EXTSZINHERIT))
 +		ip->i_extsize =3D XFS_B_TO_FSB(mp, fa->fsx_extsize);
  	else
 -		ip->i_d.di_cowextsize =3D 0;
 +		ip->i_extsize =3D 0;
 +
 +	if (xfs_sb_version_has_v3inode(&mp->m_sb)) {
 +		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 +			ip->i_cowextsize =3D XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
 +		else
 +			ip->i_cowextsize =3D 0;
 +	}
 =20
+ skip_xattr:
  	error =3D xfs_trans_commit(tp);
 =20
  	/*

--Sig_/+0h8o+Tfh_0aLzsJvyln3zB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzrtMACgkQAVBC80lX
0Gxf2gf+OBb+8MADvgbv7fA9mypAH5vfSRxGZZEHdqSVtefNprwtpVaXSI46HYf+
gqOO4sJ7uJrRvpDiAqPJSBqjWnD8M/5jGLrqqte1N61vj0MbEtYN/vEKXDB9Bg15
HfUVvPuQr7V8vhjxXQDU2WGWKPwuk/M0vY0oDChcbgiRs6YJ0Yote9M4yK8tOVQA
kHIvku0iCZh+TIVDzJJ/qdLAVlQwc4Ipzw3fls9eavq4iG1Uw7HSqBMdn4nNdcnq
s4bw9dxS+Q9Ccnjjum+j+njeQw3D0F+4V4yzmwmYCYkK+CbtVj3bnyfXthIz7o6s
04op72UlUMbWiZUUdt5LwpYna6qoNw==
=IY10
-----END PGP SIGNATURE-----

--Sig_/+0h8o+Tfh_0aLzsJvyln3zB--
