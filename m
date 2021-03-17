Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0A333EAD5
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 08:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhCQHxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 03:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhCQHxK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 03:53:10 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA105C06174A;
        Wed, 17 Mar 2021 00:53:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0j7j38pGz9sRR;
        Wed, 17 Mar 2021 18:53:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615967586;
        bh=wJm+RJKjfzcYlWP9VSCWfeMNmJeeJ50VeASNhonQuVs=;
        h=Date:From:To:Cc:Subject:From;
        b=Tn2P4NLdB7Kfsa9C5DNHIkcf9IE4//oj4Mq0ng8WXH+Szmw9nldejBX8CIsRnKV71
         6VOeBRgBzQJ2NWRsJ4qXK5jhAu3fzVSCVaDxwtV3IXLGuASZl59x05LJKntJYU8HwE
         PaIrpvaOOqynITZOEsoiN9XiGCLS9sEjhuCoB2lA4DJFAAArIIw2Dp5OdkRiFtADh4
         Z4B86I0X1gdbPxMy3tYMF2IqrD3roddUoBc8sztUYrcXwHS/c+xaANQKHrnzeDm3lL
         Xr8BjHzwJdAf+cyELJmfxNi0hUvysb90forlhbXH92OSjYJqlSbkR0w/8An2s5/e0U
         Y5mMMP4Nte7Eg==
Date:   Wed, 17 Mar 2021 18:53:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>
Cc:     Steve French <stfrench@microsoft.com>,
        Hyunchul Lee <hyc.lee@gmail.com>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cifsd tree
Message-ID: <20210317185304.6b92290c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0oxxw=il_.479O=HYzwkp.r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0oxxw=il_.479O=HYzwkp.r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifsd tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: fs/cifsd/misc.o:(.opd+0xc0): multiple definition of `extract_sharename'=
; fs/cifs/unc.o:(.opd+0x18): first defined here
ld: fs/cifsd/misc.o: in function `.extract_sharename':
misc.c:(.text.extract_sharename+0x0): multiple definition of `.extract_shar=
ename'; fs/cifs/unc.o:unc.c:(.text.extract_sharename+0x0): first defined he=
re

Caused by commit

  cabcebc31de4 ("cifsd: introduce SMB3 kernel server")

I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Mar 2021 18:35:55 +1100
Subject: [PATCH] cifsd: uniquify extract_sharename()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/cifsd/misc.c    | 4 ++--
 fs/cifsd/misc.h    | 2 +-
 fs/cifsd/smb2pdu.c | 2 +-
 fs/cifsd/unicode.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/cifsd/misc.c b/fs/cifsd/misc.c
index 9e689c33f7bb..2e83cfc43be9 100644
--- a/fs/cifsd/misc.c
+++ b/fs/cifsd/misc.c
@@ -210,12 +210,12 @@ void ksmbd_conv_path_to_windows(char *path)
 }
=20
 /**
- * extract_sharename() - get share name from tree connect request
+ * cifsd_extract_sharename() - get share name from tree connect request
  * @treename:	buffer containing tree name and share name
  *
  * Return:      share name on success, otherwise error
  */
-char *extract_sharename(char *treename)
+char *cifsd_extract_sharename(char *treename)
 {
 	char *name =3D treename;
 	char *dst;
diff --git a/fs/cifsd/misc.h b/fs/cifsd/misc.h
index d67843aad509..4cb0d4bebb21 100644
--- a/fs/cifsd/misc.h
+++ b/fs/cifsd/misc.h
@@ -25,7 +25,7 @@ void ksmbd_conv_path_to_unix(char *path);
 void ksmbd_strip_last_slash(char *path);
 void ksmbd_conv_path_to_windows(char *path);
=20
-char *extract_sharename(char *treename);
+char *cifsd_extract_sharename(char *treename);
=20
 char *convert_to_unix_name(struct ksmbd_share_config *share, char *name);
=20
diff --git a/fs/cifsd/smb2pdu.c b/fs/cifsd/smb2pdu.c
index b20cc07ee809..3da96ebeae8b 100644
--- a/fs/cifsd/smb2pdu.c
+++ b/fs/cifsd/smb2pdu.c
@@ -1709,7 +1709,7 @@ int smb2_tree_connect(struct ksmbd_work *work)
 		goto out_err1;
 	}
=20
-	name =3D extract_sharename(treename);
+	name =3D cifsd_extract_sharename(treename);
 	if (IS_ERR(name)) {
 		status.ret =3D KSMBD_TREE_CONN_STATUS_ERROR;
 		goto out_err1;
diff --git a/fs/cifsd/unicode.h b/fs/cifsd/unicode.h
index 228a02c9b95d..16269c098f86 100644
--- a/fs/cifsd/unicode.h
+++ b/fs/cifsd/unicode.h
@@ -69,7 +69,7 @@ char *smb_strndup_from_utf16(const char *src, const int m=
axlen,
 		const struct nls_table *codepage);
 extern int smbConvertToUTF16(__le16 *target, const char *source, int srcle=
n,
 		const struct nls_table *cp, int mapchars);
-extern char *extract_sharename(char *treename);
+extern char *cifsd_extract_sharename(char *treename);
 #endif
=20
 wchar_t cifs_toupper(wchar_t in);
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/0oxxw=il_.479O=HYzwkp.r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRtWAACgkQAVBC80lX
0GzRWggAgiPsn9hdVrE2WD+qNgxwEOIlAvSkGHm8XnTMa6RJ3vh5PzPttL4rIb7M
Ko6AjrhRHU8L/I1JoZ6rNtoIeVFnYGYLq0RHEKXsdPq4fUe0jb6eiWw0s9DBvwEE
cGiIIKb4ulUK8v8O6FirLq+Syv5nrrIHR0MtdCR3deBGpf7eTy2LErThwQkOTJG3
5ieo/90c8mFT667p5XyMLz7MO3lmM2YQ9L5b+/hPQXSWbYDbbJl2FZRyjGtdki2/
Xqa4UtSSm59JfBpH8crz6vKAJmXJTHHM4PCtfBXieEtRLEh4Azt5iUWW3uAMrB3x
6LlVna9dhdCs4vE/VzTK85hqYK4b7Q==
=RB5s
-----END PGP SIGNATURE-----

--Sig_/0oxxw=il_.479O=HYzwkp.r--
