Return-Path: <linux-next+bounces-8390-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C295B89AEB
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 15:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E8A3A9E5E
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 13:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881431E1DE5;
	Fri, 19 Sep 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWGxcajF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E17B3F9FB;
	Fri, 19 Sep 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288684; cv=none; b=OcZrL9iAZ14OD9QmVtniNPwu44X/G7mfML1grZ6c+gt9m1Go6OzmAHSYgFNBCMmGK+awJA4cXU82XlfR0OcHY7IzOlS4xAogSLBvGWtcekidICZUMPjt97+I0wyh1ID17Ac0vfgMhSpOTMnnc8Xw8Xc8uIZBdxXGvJEu98V9Sxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288684; c=relaxed/simple;
	bh=1JS6EZirYX5agBwlYQfaWvJw5kndsqBcirPBO//5Uy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rv5PW/dYWQxdpk7kjkKyFEIubjlqwGy7+sdOl4I/JDA7W5FiMOT14qfkTwitTuGqtwRw+qLK2AIboCZSCBYCqnNtwiHDRJ1k97PzjzNZWkAxEsvFIpzhe5qV6TluO/Ni9uotCPsmUzmJY+or/1/u+r5KzUXqGQinSC6Usseo13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWGxcajF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3706C4CEF0;
	Fri, 19 Sep 2025 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758288683;
	bh=1JS6EZirYX5agBwlYQfaWvJw5kndsqBcirPBO//5Uy4=;
	h=Date:From:To:Cc:Subject:From;
	b=oWGxcajFSnrtZbPCU4PLFPuV5farJJCofwk6QS8M8MbEIP7CquFDKxNUZHyvuYPiV
	 e/POjh27cNkBcrxtA/NDgDt3z6rKo338OG5wAg/IXBjGuIjz+gO2gyTRe6cxJsXSaC
	 LMJPVg1ouspoe8xMZVhTUXfXvowotcvsMP8UNYrt/5ak6Mnj2GggR5VCE7QZ2HxG5x
	 1DVB46D7+awrNbbTrA+4Vsqw8PiFS11ijAFYpJARNPMwL6gYoSK5a4lUyqxDBtEWnP
	 HWvVsqmobRKJw0tLL+v9DcOOYZandcBOTLDJOviY6OjIhbFocMCBFOzmwsme97qaL1
	 QjKNF8pSFYdBg==
Date: Fri, 19 Sep 2025 14:31:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ashish Kalra <ashish.kalra@amd.com>, Borislav Petkov <bp@alien8.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <aM1bJqhtojdLhp3c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8YhV4ULrzSrkBERl"
Content-Disposition: inline


--8YhV4ULrzSrkBERl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/crypto/ccp/sev-dev.c

between commits:

  45d59bd4a3e0f ("crypto: ccp - Introduce new API interface to indicate SEV=
-SNP Ciphertext hiding feature")
  33cfb80d1910b ("crypto: ccp - Add support for SNP_FEATURE_INFO command")

=66rom the crypto tree and commit:

  e09701dcdd9ca ("crypto: ccp - Add new HV-Fixed page allocation/free API")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc drivers/crypto/ccp/sev-dev.c
index d3465c251eb0a,f7b9c6547e18f..0000000000000
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@@ -1077,88 -1088,165 +1092,247 @@@ static void snp_set_hsave_pa(void *arg
  	wrmsrq(MSR_VM_HSAVE_PA, 0);
  }
 =20
 +bool sev_is_snp_ciphertext_hiding_supported(void)
 +{
 +	struct psp_device *psp =3D psp_master;
 +	struct sev_device *sev;
 +
 +	if (!psp || !psp->sev_data)
 +		return false;
 +
 +	sev =3D psp->sev_data;
 +
 +	/*
 +	 * Feature information indicates if CipherTextHiding feature is
 +	 * supported by the SEV firmware and additionally platform status
 +	 * indicates if CipherTextHiding feature is enabled in the
 +	 * Platform BIOS.
 +	 */
 +	return ((sev->snp_feat_info_0.ecx & SNP_CIPHER_TEXT_HIDING_SUPPORTED) &&
 +		 sev->snp_plat_status.ciphertext_hiding_cap);
 +}
 +EXPORT_SYMBOL_GPL(sev_is_snp_ciphertext_hiding_supported);
 +
 +static int snp_get_platform_data(struct sev_device *sev, int *error)
 +{
 +	struct sev_data_snp_feature_info snp_feat_info;
 +	struct snp_feature_info *feat_info;
 +	struct sev_data_snp_addr buf;
 +	struct page *page;
 +	int rc;
 +
 +	/*
 +	 * This function is expected to be called before SNP is
 +	 * initialized.
 +	 */
 +	if (sev->snp_initialized)
 +		return -EINVAL;
 +
 +	buf.address =3D __psp_pa(&sev->snp_plat_status);
 +	rc =3D sev_do_cmd(SEV_CMD_SNP_PLATFORM_STATUS, &buf, error);
 +	if (rc) {
 +		dev_err(sev->dev, "SNP PLATFORM_STATUS command failed, ret =3D %d, erro=
r =3D %#x\n",
 +			rc, *error);
 +		return rc;
 +	}
 +
 +	sev->api_major =3D sev->snp_plat_status.api_major;
 +	sev->api_minor =3D sev->snp_plat_status.api_minor;
 +	sev->build =3D sev->snp_plat_status.build_id;
 +
 +	/*
 +	 * Do feature discovery of the currently loaded firmware,
 +	 * and cache feature information from CPUID 0x8000_0024,
 +	 * sub-function 0.
 +	 */
 +	if (!sev->snp_plat_status.feature_info)
 +		return 0;
 +
 +	/*
 +	 * Use dynamically allocated structure for the SNP_FEATURE_INFO
 +	 * command to ensure structure is 8-byte aligned, and does not
 +	 * cross a page boundary.
 +	 */
 +	page =3D alloc_page(GFP_KERNEL);
 +	if (!page)
 +		return -ENOMEM;
 +
 +	feat_info =3D page_address(page);
 +	snp_feat_info.length =3D sizeof(snp_feat_info);
 +	snp_feat_info.ecx_in =3D 0;
 +	snp_feat_info.feature_info_paddr =3D __psp_pa(feat_info);
 +
 +	rc =3D sev_do_cmd(SEV_CMD_SNP_FEATURE_INFO, &snp_feat_info, error);
 +	if (!rc)
 +		sev->snp_feat_info_0 =3D *feat_info;
 +	else
 +		dev_err(sev->dev, "SNP FEATURE_INFO command failed, ret =3D %d, error =
=3D %#x\n",
 +			rc, *error);
 +
 +	__free_page(page);
 +
 +	return rc;
 +}
 +
+ /* Hypervisor Fixed pages API interface */
+ static void snp_hv_fixed_pages_state_update(struct sev_device *sev,
+ 					    enum snp_hv_fixed_pages_state page_state)
+ {
+ 	struct snp_hv_fixed_pages_entry *entry;
+=20
+ 	/* List is protected by sev_cmd_mutex */
+ 	lockdep_assert_held(&sev_cmd_mutex);
+=20
+ 	if (list_empty(&snp_hv_fixed_pages))
+ 		return;
+=20
+ 	list_for_each_entry(entry, &snp_hv_fixed_pages, list)
+ 		entry->page_state =3D page_state;
+ }
+=20
+ /*
+  * Allocate HV_FIXED pages in 2MB aligned sizes to ensure the whole
+  * 2MB pages are marked as HV_FIXED.
+  */
+ struct page *snp_alloc_hv_fixed_pages(unsigned int num_2mb_pages)
+ {
+ 	struct psp_device *psp_master =3D psp_get_master_device();
+ 	struct snp_hv_fixed_pages_entry *entry;
+ 	struct sev_device *sev;
+ 	unsigned int order;
+ 	struct page *page;
+=20
+ 	if (!psp_master || !psp_master->sev_data)
+ 		return NULL;
+=20
+ 	sev =3D psp_master->sev_data;
+=20
+ 	order =3D get_order(PMD_SIZE * num_2mb_pages);
+=20
+ 	/*
+ 	 * SNP_INIT_EX is protected by sev_cmd_mutex, therefore this list
+ 	 * also needs to be protected using the same mutex.
+ 	 */
+ 	guard(mutex)(&sev_cmd_mutex);
+=20
+ 	/*
+ 	 * This API uses SNP_INIT_EX to transition allocated pages to HV_Fixed
+ 	 * page state, fail if SNP is already initialized.
+ 	 */
+ 	if (sev->snp_initialized)
+ 		return NULL;
+=20
+ 	/* Re-use freed pages that match the request */
+ 	list_for_each_entry(entry, &snp_hv_fixed_pages, list) {
+ 		/* Hypervisor fixed page allocator implements exact fit policy */
+ 		if (entry->order =3D=3D order && entry->free) {
+ 			entry->free =3D false;
+ 			memset(page_address(entry->page), 0,
+ 			       (1 << entry->order) * PAGE_SIZE);
+ 			return entry->page;
+ 		}
+ 	}
+=20
+ 	page =3D alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
+ 	if (!page)
+ 		return NULL;
+=20
+ 	entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
+ 	if (!entry) {
+ 		__free_pages(page, order);
+ 		return NULL;
+ 	}
+=20
+ 	entry->page =3D page;
+ 	entry->order =3D order;
+ 	list_add_tail(&entry->list, &snp_hv_fixed_pages);
+=20
+ 	return page;
+ }
+=20
+ void snp_free_hv_fixed_pages(struct page *page)
+ {
+ 	struct psp_device *psp_master =3D psp_get_master_device();
+ 	struct snp_hv_fixed_pages_entry *entry, *nentry;
+=20
+ 	if (!psp_master || !psp_master->sev_data)
+ 		return;
+=20
+ 	/*
+ 	 * SNP_INIT_EX is protected by sev_cmd_mutex, therefore this list
+ 	 * also needs to be protected using the same mutex.
+ 	 */
+ 	guard(mutex)(&sev_cmd_mutex);
+=20
+ 	list_for_each_entry_safe(entry, nentry, &snp_hv_fixed_pages, list) {
+ 		if (entry->page !=3D page)
+ 			continue;
+=20
+ 		/*
+ 		 * HV_FIXED page state cannot be changed until reboot
+ 		 * and they cannot be used by an SNP guest, so they cannot
+ 		 * be returned back to the page allocator.
+ 		 * Mark the pages as free internally to allow possible re-use.
+ 		 */
+ 		if (entry->page_state =3D=3D HV_FIXED) {
+ 			entry->free =3D true;
+ 		} else {
+ 			__free_pages(page, entry->order);
+ 			list_del(&entry->list);
+ 			kfree(entry);
+ 		}
+ 		return;
+ 	}
+ }
+=20
+ static void snp_add_hv_fixed_pages(struct sev_device *sev, struct sev_dat=
a_range_list *range_list)
+ {
+ 	struct snp_hv_fixed_pages_entry *entry;
+ 	struct sev_data_range *range;
+ 	int num_elements;
+=20
+ 	lockdep_assert_held(&sev_cmd_mutex);
+=20
+ 	if (list_empty(&snp_hv_fixed_pages))
+ 		return;
+=20
+ 	num_elements =3D list_count_nodes(&snp_hv_fixed_pages) +
+ 		       range_list->num_elements;
+=20
+ 	/*
+ 	 * Ensure the list of HV_FIXED pages that will be passed to firmware
+ 	 * do not exceed the page-sized argument buffer.
+ 	 */
+ 	if (num_elements * sizeof(*range) + sizeof(*range_list) > PAGE_SIZE) {
+ 		dev_warn(sev->dev, "Additional HV_Fixed pages cannot be accommodated, o=
mitting\n");
+ 		return;
+ 	}
+=20
+ 	range =3D &range_list->ranges[range_list->num_elements];
+ 	list_for_each_entry(entry, &snp_hv_fixed_pages, list) {
+ 		range->base =3D page_to_pfn(entry->page) << PAGE_SHIFT;
+ 		range->page_count =3D 1 << entry->order;
+ 		range++;
+ 	}
+ 	range_list->num_elements =3D num_elements;
+ }
+=20
+ static void snp_leak_hv_fixed_pages(void)
+ {
+ 	struct snp_hv_fixed_pages_entry *entry;
+=20
+ 	/* List is protected by sev_cmd_mutex */
+ 	lockdep_assert_held(&sev_cmd_mutex);
+=20
+ 	if (list_empty(&snp_hv_fixed_pages))
+ 		return;
+=20
+ 	list_for_each_entry(entry, &snp_hv_fixed_pages, list)
+ 		if (entry->page_state =3D=3D HV_FIXED)
+ 			__snp_leak_pages(page_to_pfn(entry->page),
+ 					 1 << entry->order, false);
+ }
+=20
  static int snp_filter_reserved_mem_regions(struct resource *rs, void *arg)
  {
  	struct sev_data_range_list *range_list =3D arg;
@@@ -1249,13 -1337,13 +1423,19 @@@ static int __sev_snp_init_locked(int *e
  			return rc;
  		}
 =20
+ 		/*
+ 		 * Add HV_Fixed pages from other PSP sub-devices, such as SFS to the
+ 		 * HV_Fixed page list.
+ 		 */
+ 		snp_add_hv_fixed_pages(sev, snp_range_list);
+=20
  		memset(&data, 0, sizeof(data));
 +
 +		if (max_snp_asid) {
 +			data.ciphertext_hiding_en =3D 1;
 +			data.max_snp_asid =3D max_snp_asid;
 +		}
 +
  		data.init_rmp =3D 1;
  		data.list_paddr_en =3D 1;
  		data.list_paddr =3D __psp_pa(snp_range_list);

--8YhV4ULrzSrkBERl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNWyYACgkQJNaLcl1U
h9CzBwf+NUy97dL3IcV0kPsvoKgJoCl0uSr+FatDPsUu6f62FZqFPQIRQbsX68uO
0hR1Mg+1+TRfuNihLb5AsKR37tnQS5T/8cwUbdhc7MnXHUaccUZyd/PqbBHe51sm
33kHuJKteTqYp0HPJqDBI5apcnjdh+GyC237dpEa/HdHPJ8zMETJPYLY+YPCn79L
4JB33LrVnCXyV1UCDtmYdsqbkcU/mfKefHy/fwCoDr3C1h/21wKfZDGrBhu6ZaJe
ZX3qU4Ut6Hsn9xpfaHb5yTtKBm9gWqOqD8pbOhjgaAelMJirt0M5kuDsv0b14W2D
hHrZhcQydsyJw1ziHFWshcMJnk7yMQ==
=isBY
-----END PGP SIGNATURE-----

--8YhV4ULrzSrkBERl--

