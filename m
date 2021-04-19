Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FBD3638DE
	for <lists+linux-next@lfdr.de>; Mon, 19 Apr 2021 02:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235645AbhDSAu3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Apr 2021 20:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhDSAu3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 18 Apr 2021 20:50:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E109C06174A;
        Sun, 18 Apr 2021 17:50:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FNpBB5c7xz9tlC;
        Mon, 19 Apr 2021 10:49:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618793396;
        bh=RvcQsImDVi/p3uATnp9KP+phSL29G3tjajJIKF67gxM=;
        h=Date:From:To:Cc:Subject:From;
        b=DVl/CvV8fFjpm4hBDqeS4IwJs5wZkjX3zZhM97fJwyogTGQ2ZbWeFWP+CucT5rssI
         JcqAcTQAfbbON6mDUCRDxDZANOK5DfEWjMOB+zZONKf7e8ji+O37h5Pod1MZvYkmwx
         nkm3CzSFVTR19BJecPCS5rAkmU9vytCp5mpcJ0w9Jkj8k+eRhrEoxp/RX0MsSEL373
         qZf3jEaVpKA6+xYUB/QFvVuQA3RB728FMdoUv78HVabhUYsSxe0ZpuvLlAJCdjpRSV
         ieL+3mgYIdOrrYnpbhrcZ3eGX4NO9ZDnaIbhyHlVlvLP79KtU1tNAfcml4NrDDBx8S
         WXKaTNazsGHYg==
Date:   Mon, 19 Apr 2021 10:49:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the vfs tree with the xfs tree
Message-ID: <20210419104948.7be23015@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MSqUuCQP3/wpjIM9GXw96aU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MSqUuCQP3/wpjIM9GXw96aU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/xfs/xfs_ioctl.c

between commit:

  b2197a36c0ef ("xfs: remove XFS_IFEXTENTS")

from the xfs tree and commit:

  9fefd5db08ce ("xfs: convert to fileattr")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/xfs/xfs_ioctl.c
index bf490bfae6cb,bbda105a2ce5..000000000000
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@@ -1056,77 -1057,17 +1057,19 @@@ xfs_ioc_ag_geometry
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
 -	if (ifp && (ifp->if_flags & XFS_IFEXTENTS))
 +
 +	fa->fsx_extsize =3D XFS_FSB_TO_B(mp, ip->i_extsize);
 +	if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
 +		fa->fsx_cowextsize =3D XFS_FSB_TO_B(mp, ip->i_cowextsize);
 +	fa->fsx_projid =3D ip->i_projid;
 +	if (ifp && !xfs_need_iread_extents(ifp))
  		fa->fsx_nextents =3D xfs_iext_count(ifp);
  	else
  		fa->fsx_nextents =3D xfs_ifork_nextents(ifp);
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

--Sig_/MSqUuCQP3/wpjIM9GXw96aU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB806wACgkQAVBC80lX
0GzcCwgAnoxu6Dc4L/mYs/vFg2p/AfhJ2qsSQak/UT7fV+6TNxOtucH6dBSd2sDp
wat2nrVSsxNBrbi78Khj/sDNa0mc1BxOJvFkEHAiLofH/mbFWPAoT+Xx6pfWq6z5
zBBe3SFWkJtd31OnflzI7xQlRh8jqMMf1HHLvsmRe8fP9INnnKtLAkeY/PXzdWOf
Yy73th598WSyyi5wMZ3Dbf2xREeI6UPFCREtD9Z/YtWBAAnjfxRnBvi42OQaRROO
bun4P+Ga0iz2t71ZCYUDDV5KPsdO9NopkCHdqGDEFdwLZngB5owXOeTjqTTBgoO6
BhnnA6sjFqgpQ0rXpq+pTKlgx+GkFQ==
=6VOz
-----END PGP SIGNATURE-----

--Sig_/MSqUuCQP3/wpjIM9GXw96aU--
