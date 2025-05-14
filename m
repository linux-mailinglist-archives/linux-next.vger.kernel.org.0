Return-Path: <linux-next+bounces-6760-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3EAAB60DD
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 04:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C457D1B62881
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 02:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE17D1E5216;
	Wed, 14 May 2025 02:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UgKVDr57"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB41E51EA;
	Wed, 14 May 2025 02:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190499; cv=none; b=EZeIQDKfmQz6y0wtEX+ZwE41FRiaIFcH8vps15+m6UigeeuyCgeFa4KjWePZ16/oX4GDW2G+vPUnt6DpBrY+feWshyNgFpHl+QjdlzwOoxRZ1Fi1Bhu59gO+6eApcF7WSskAAqK8rsW1BMt9XmD6R3JG/aUSOl7QCWnJR3OhO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190499; c=relaxed/simple;
	bh=5OWB8LQMvi2JLr2dlMyZX7enw7nqebnGAVVl8sUIl10=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkapQ66h8EDanu8IIuOmoBS8SCva7nDWs7hlWsG9EfjKfPwT6dcl8/UQSqNyYK+OgFZXo5Vzt9UwN7yrmz9LuJuLiW67wXpwBCIK58EGfMxniYBA8YbfuTZbTKfT3WWjj5fhe0Mmlxy3Xk52vF9KEkU6SuGPjaZ4RNbxmiFtfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UgKVDr57; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747190492;
	bh=apRSeIvAJaMbxRwzmk2VMvkxnVfxkWwklMx55XL8mPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UgKVDr57jXfcCVP2/cwhi9vcQ5NLjJEIXaiWzMhoKKs4tKE9ULfrgfVB4N8opG8JE
	 GClWu+Q8DOEG5+4ahEt3Y22RcqTA0Bn9Bt+cdUZgbYHTIzw1gPoGhmyNOJI+9s0Joh
	 4GRDOu84U6BikMiSVDLiyTgotpYIIxLMeKxi/lnQyKWWGF4PV2Orm1OMAGatBFuzIq
	 YIjZL52Wl4h0FXuHqGuvd1CxyHL57Zh3iVLCmh6q6Fm8hEFGSL+yoIsgWCbTK0zBmp
	 oUp2rsbfzXMd3vL8Hanq0vKq/YBNzfJrRtPKmkMrvZ5Bk8cnvsI3XV1LSCKoMmT3Fu
	 Atk/5VOoHbFoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxyK76qztz4x8f;
	Wed, 14 May 2025 12:41:31 +1000 (AEST)
Date: Wed, 14 May 2025 12:41:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with Linus'
 tree
Message-ID: <20250514124131.15d0117f@canb.auug.org.au>
In-Reply-To: <20250508132459.04bd8e70@canb.auug.org.au>
References: <20250506114402.2f440664@canb.auug.org.au>
	<f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
	<20250507111026.4700e392@canb.auug.org.au>
	<3d5761da40d0ddf4109d10d6f3c3d2538c4d89d4.camel@sipsolutions.net>
	<20250508132459.04bd8e70@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kqa3x878=XdluXpj8IW.=0B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kqa3x878=XdluXpj8IW.=0B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 May 2025 13:24:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 07 May 2025 07:37:46 +0200 Johannes Berg <johannes@sipsolutions.n=
et> wrote:
> > =20
> > > So, at your suggestion, I just used the latter versions of these file=
s,
> > > but I then got the following build failure:   =20
> >=20
> > Ouch, sorry about that. That sounds like it's due to the duplicate
> > commits you had pointed out, which Miri dropped from iwlwifi-next now.
> >=20
> > On the plus side, I'm going to be the one who has to resolve these
> > conflicts (soon) :) =20
>=20
> There are real conficts (see below).
>=20
> > > So, today I have merged the iwlwifi-next tree from next-20250505 (whi=
ch
> > > was effectively empty).  You may want to try merging the iwlwifi tree
> > > into the iwlwifi-next tree and resolve any conflicts yourself (now th=
at
> > > the iwlwifi tree has been merged into Linus' tree).   =20
> >=20
> > Not sure what you mean by "iwlwifi tree", I think iwlwifi-next/fixes was
> > empty, so perhaps you meant "wireless tree" instead? =20
>=20
> Yeah, that or just commit 175e69e33c66 (which has been merged into
> Linus' tree).
>=20
> > But yeah, I know what all the code is and what's going on, though
> > evidently less than I thought after the recent updates. =20
>=20
> So today, I have applied the following clean up patch, but it does mean
> that the 2 commits mentioned from Linus' tree have been reverted in
> linus-next.  This means that linux-next builds today with the
> iwlwifi-next tree merged.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 8 May 2025 12:26:09 +1000
> Subject: [PATCH] iwlwifi: remove the left over bits of 2 commits from Lin=
us' tree
>=20
> Commits
>=20
>   d49437a6afc7 ("wifi: iwlwifi: back off on continuous errors")
>   15220a257319 ("wifi: iwlwifi: don't warn if the NIC is gone in resume")
>=20
> were partly removed by just taking the MERGE_HAD versions of
>=20
>   drivers/net/wireless/intel/iwlwifi/cfg/sc.c
>   drivers/net/wireless/intel/iwlwifi/iwl-config.h
>   drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
>   drivers/net/wireless/intel/iwlwifi/iwl-trans.c
>   drivers/net/wireless/intel/iwlwifi/iwl-trans.h
>   drivers/net/wireless/intel/iwlwifi/pcie/drv.c
>   drivers/net/wireless/intel/iwlwifi/tests/devinfo.c
>=20
> This removes the rest.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  .../net/wireless/intel/iwlwifi/pcie/internal.h   |  9 ++++-----
>  drivers/net/wireless/intel/iwlwifi/pcie/trans.c  | 16 ++++------------
>  drivers/net/wireless/intel/iwlwifi/pcie/tx.c     |  2 +-
>  3 files changed, 9 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/internal.h b/drivers=
/net/wireless/intel/iwlwifi/pcie/internal.h
> index b5368b256e20..8adeddeb0e4c 100644
> --- a/drivers/net/wireless/intel/iwlwifi/pcie/internal.h
> +++ b/drivers/net/wireless/intel/iwlwifi/pcie/internal.h
> @@ -542,10 +542,10 @@ void iwl_trans_pcie_free(struct iwl_trans *trans);
>  void iwl_trans_pcie_free_pnvm_dram_regions(struct iwl_dram_regions *dram=
_regions,
>  					   struct device *dev);
> =20
> -bool __iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans, bool sile=
nt);
> -#define _iwl_trans_pcie_grab_nic_access(trans, silent)		\
> +bool __iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans);
> +#define _iwl_trans_pcie_grab_nic_access(trans)			\
>  	__cond_lock(nic_access_nobh,				\
> -		    likely(__iwl_trans_pcie_grab_nic_access(trans, silent)))
> +		    likely(__iwl_trans_pcie_grab_nic_access(trans)))
> =20
>  void iwl_trans_pcie_check_product_reset_status(struct pci_dev *pdev);
>  void iwl_trans_pcie_check_product_reset_mode(struct pci_dev *pdev);
> @@ -1101,8 +1101,7 @@ void iwl_trans_pcie_set_bits_mask(struct iwl_trans =
*trans, u32 reg,
>  int iwl_trans_pcie_read_config32(struct iwl_trans *trans, u32 ofs,
>  				 u32 *val);
>  bool iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans);
> -void __releases(nic_access_nobh)
> -iwl_trans_pcie_release_nic_access(struct iwl_trans *trans);
> +void iwl_trans_pcie_release_nic_access(struct iwl_trans *trans);
> =20
>  /* transport gen 1 exported functions */
>  void iwl_trans_pcie_fw_alive(struct iwl_trans *trans);
> diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/ne=
t/wireless/intel/iwlwifi/pcie/trans.c
> index 799d651ddd8a..4d281c702eec 100644
> --- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
> +++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
> @@ -2333,8 +2333,7 @@ void iwl_trans_pcie_reset(struct iwl_trans *trans, =
enum iwl_reset_mode mode)
>  	struct iwl_trans_pcie_removal *removal;
>  	char _msg =3D 0, *msg =3D &_msg;
> =20
> -	if (WARN_ON(mode < IWL_RESET_MODE_REMOVE_ONLY ||
> -		    mode =3D=3D IWL_RESET_MODE_BACKOFF))
> +	if (WARN_ON(mode < IWL_RESET_MODE_REMOVE_ONLY))
>  		return;
> =20
>  	if (test_bit(STATUS_TRANS_DEAD, &trans->status))
> @@ -2388,7 +2387,7 @@ EXPORT_SYMBOL(iwl_trans_pcie_reset);
>   * This version doesn't disable BHs but rather assumes they're
>   * already disabled.
>   */
> -bool __iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans, bool sile=
nt)
> +bool __iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans)
>  {
>  	int ret;
>  	struct iwl_trans_pcie *trans_pcie =3D IWL_TRANS_GET_PCIE_TRANS(trans);
> @@ -2440,11 +2439,6 @@ bool __iwl_trans_pcie_grab_nic_access(struct iwl_t=
rans *trans, bool silent)
>  	if (unlikely(ret < 0)) {
>  		u32 cntrl =3D iwl_read32(trans, CSR_GP_CNTRL);
> =20
> -		if (silent) {
> -			spin_unlock(&trans_pcie->reg_lock);
> -			return false;
> -		}
> -
>  		WARN_ONCE(1,
>  			  "Timeout waiting for hardware access (CSR_GP_CNTRL 0x%08x)\n",
>  			  cntrl);
> @@ -2476,7 +2470,7 @@ bool iwl_trans_pcie_grab_nic_access(struct iwl_tran=
s *trans)
>  	bool ret;
> =20
>  	local_bh_disable();
> -	ret =3D __iwl_trans_pcie_grab_nic_access(trans, false);
> +	ret =3D __iwl_trans_pcie_grab_nic_access(trans);
>  	if (ret) {
>  		/* keep BHs disabled until iwl_trans_pcie_release_nic_access */
>  		return ret;
> @@ -2485,8 +2479,7 @@ bool iwl_trans_pcie_grab_nic_access(struct iwl_tran=
s *trans)
>  	return false;
>  }
> =20
> -void __releases(nic_access_nobh)
> -iwl_trans_pcie_release_nic_access(struct iwl_trans *trans)
> +void iwl_trans_pcie_release_nic_access(struct iwl_trans *trans)
>  {
>  	struct iwl_trans_pcie *trans_pcie =3D IWL_TRANS_GET_PCIE_TRANS(trans);
> =20
> @@ -2513,7 +2506,6 @@ iwl_trans_pcie_release_nic_access(struct iwl_trans =
*trans)
>  	 * scheduled on different CPUs (after we drop reg_lock).
>  	 */
>  out:
> -	__release(nic_access_nobh);
>  	spin_unlock_bh(&trans_pcie->reg_lock);
>  }
> =20
> diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c b/drivers/net/w=
ireless/intel/iwlwifi/pcie/tx.c
> index f142b8beb396..c876912e9aaf 100644
> --- a/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
> +++ b/drivers/net/wireless/intel/iwlwifi/pcie/tx.c
> @@ -1018,7 +1018,7 @@ static int iwl_pcie_set_cmd_in_flight(struct iwl_tr=
ans *trans,
>  	 * returned. This needs to be done only on NICs that have
>  	 * apmg_wake_up_wa set (see above.)
>  	 */
> -	if (!_iwl_trans_pcie_grab_nic_access(trans, false))
> +	if (!_iwl_trans_pcie_grab_nic_access(trans))
>  		return -EIO;
> =20
>  	/*
> --=20
> 2.47.2

I keep getting more conflicts in the above files (each time one of them
get modified in the iwlwifi-next tree.  Could you please merge commit

 ebedf8b7f05b ("wifi: iwlwifi: add support for Killer on MTL")

or the current net tree
(git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git#main)
into the iwlwifi-next tree and fix up the conflicts.  I believe that
will clean up all the conflicts - that are really just between bug
fixes for iwlwifi and the new development).

--=20
Cheers,
Stephen Rothwell

--Sig_/kqa3x878=XdluXpj8IW.=0B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgkAtsACgkQAVBC80lX
0GzkSwf/bqlQJS9oNBxRf5LlaNR6612a6K0HtDBMb7Wjf9R5zF/RFIf1/zyfGOrC
OMcIAvL6z1PBDpP8qhXzW3Nuea5HRpKRbmW1DQZV0uehKwuRr6t7zVx9jw7715K5
ix3QhP22mKH7XHVKD1Dyz3JRsMSQcRpABH0os6pI2bSLjcpY1mJWIY7UNKhe5QgC
gyj+OJ2jsqWq3bdxQiMJZPoz2+LADbPRlfQL3F32pJn59b1OH/uZIjzc/wksxk89
zLXMAb2GFH3nR0C9qLIqDdsveg9hrltHvJ1NnAvVzvvw7jLhp/rny+Qs0zY6gGpa
edJJ6nV8WNJplPlJ19oIUjZBuw3XeA==
=d5NM
-----END PGP SIGNATURE-----

--Sig_/kqa3x878=XdluXpj8IW.=0B--

