Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2589C23D5CD
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 05:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731539AbgHFDfn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 23:35:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34881 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731507AbgHFDfe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Aug 2020 23:35:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMYzK2p09z9sPB;
        Thu,  6 Aug 2020 13:35:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596684926;
        bh=Xlq/cAe+f3dHGHaXm4qdp1a8e+CHd4mAf9i/cBq/8Rw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NUZSR199WDV3Ss+zkPZXNP+GnQs/44HAyoYvLNB2mtUYEICm5hoQv26gIhyVmNHhH
         2YYqvM7cX+i0On/I+M1M4ahgCpfqv7V3pCj0kcvzjIKaF3/uDuDF2PntxZqBW6nDF6
         xLfT9tKbNO143dp3NCiMhXmibO/cgEdRajmPpAfWmMpmOo0hECGRjd7h4Cv0X+9ySC
         4Y48Ubjg52tmZv7TIHdKyvVLQqcBmkQXl0b3JKDqDowcjYrjTnl5I1Ik+Gw7lQPrZE
         AVr9Du8uZhn1zi/Qw3vK3YUdEusm7rJhjmY2ZA6Ap49pPL055lklXRPx0sW2A15rlF
         X/6HRFN4as/Mg==
Date:   Thu, 6 Aug 2020 13:35:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Mackerras <paulus@ozlabs.org>
Cc:     Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the hmm tree with the kvm-ppc tree
Message-ID: <20200806133524.47d9e89b@canb.auug.org.au>
In-Reply-To: <20200730191610.204ed02c@canb.auug.org.au>
References: <20200730191610.204ed02c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S.pOUDO0VZ7wA8OPX4Fwvlm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S.pOUDO0VZ7wA8OPX4Fwvlm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Jul 2020 19:16:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the hmm tree got a conflict in:
>=20
>   arch/powerpc/kvm/book3s_hv_uvmem.c
>=20
> between commit:
>=20
>   f1b87ea8784b ("KVM: PPC: Book3S HV: Move kvmppc_svm_page_out up")
>=20
> from the kvm-ppc tree and commit:
>=20
>   5143192cd410 ("mm/migrate: add a flags parameter to migrate_vma")
>=20
> from the hmm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/powerpc/kvm/book3s_hv_uvmem.c
> index 0d49e3425a12,6850bd04bcb9..000000000000
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@@ -496,94 -253,14 +496,95 @@@ unsigned long kvmppc_h_svm_init_start(s
>   	return ret;
>   }
>  =20
>  -unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
>  +/*
>  + * Provision a new page on HV side and copy over the contents
>  + * from secure memory using UV_PAGE_OUT uvcall.
>  + * Caller must held kvm->arch.uvmem_lock.
>  + */
>  +static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>  +		unsigned long start,
>  +		unsigned long end, unsigned long page_shift,
>  +		struct kvm *kvm, unsigned long gpa)
>   {
>  -	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
>  -		return H_UNSUPPORTED;
>  +	unsigned long src_pfn, dst_pfn =3D 0;
>  +	struct migrate_vma mig;
>  +	struct page *dpage, *spage;
>  +	struct kvmppc_uvmem_page_pvt *pvt;
>  +	unsigned long pfn;
>  +	int ret =3D U_SUCCESS;
>  =20
>  -	kvm->arch.secure_guest |=3D KVMPPC_SECURE_INIT_DONE;
>  -	pr_info("LPID %d went secure\n", kvm->arch.lpid);
>  -	return H_SUCCESS;
>  +	memset(&mig, 0, sizeof(mig));
>  +	mig.vma =3D vma;
>  +	mig.start =3D start;
>  +	mig.end =3D end;
>  +	mig.src =3D &src_pfn;
>  +	mig.dst =3D &dst_pfn;
> - 	mig.src_owner =3D &kvmppc_uvmem_pgmap;
> ++	mig.pgmap_owner =3D &kvmppc_uvmem_pgmap;
> ++	mig.flags =3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
>  +
>  +	/* The requested page is already paged-out, nothing to do */
>  +	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
>  +		return ret;
>  +
>  +	ret =3D migrate_vma_setup(&mig);
>  +	if (ret)
>  +		return -1;
>  +
>  +	spage =3D migrate_pfn_to_page(*mig.src);
>  +	if (!spage || !(*mig.src & MIGRATE_PFN_MIGRATE))
>  +		goto out_finalize;
>  +
>  +	if (!is_zone_device_page(spage))
>  +		goto out_finalize;
>  +
>  +	dpage =3D alloc_page_vma(GFP_HIGHUSER, vma, start);
>  +	if (!dpage) {
>  +		ret =3D -1;
>  +		goto out_finalize;
>  +	}
>  +
>  +	lock_page(dpage);
>  +	pvt =3D spage->zone_device_data;
>  +	pfn =3D page_to_pfn(dpage);
>  +
>  +	/*
>  +	 * This function is used in two cases:
>  +	 * - When HV touches a secure page, for which we do UV_PAGE_OUT
>  +	 * - When a secure page is converted to shared page, we *get*
>  +	 *   the page to essentially unmap the device page. In this
>  +	 *   case we skip page-out.
>  +	 */
>  +	if (!pvt->skip_page_out)
>  +		ret =3D uv_page_out(kvm->arch.lpid, pfn << page_shift,
>  +				  gpa, 0, page_shift);
>  +
>  +	if (ret =3D=3D U_SUCCESS)
>  +		*mig.dst =3D migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
>  +	else {
>  +		unlock_page(dpage);
>  +		__free_page(dpage);
>  +		goto out_finalize;
>  +	}
>  +
>  +	migrate_vma_pages(&mig);
>  +
>  +out_finalize:
>  +	migrate_vma_finalize(&mig);
>  +	return ret;
>  +}
>  +
>  +static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>  +				      unsigned long start, unsigned long end,
>  +				      unsigned long page_shift,
>  +				      struct kvm *kvm, unsigned long gpa)
>  +{
>  +	int ret;
>  +
>  +	mutex_lock(&kvm->arch.uvmem_lock);
>  +	ret =3D __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
>  +	mutex_unlock(&kvm->arch.uvmem_lock);
>  +
>  +	return ret;
>   }
>  =20
>   /*
> @@@ -744,7 -400,20 +745,8 @@@ static int kvmppc_svm_page_in(struct vm
>   	mig.end =3D end;
>   	mig.src =3D &src_pfn;
>   	mig.dst =3D &dst_pfn;
> + 	mig.flags =3D MIGRATE_VMA_SELECT_SYSTEM;
>  =20
>  -	/*
>  -	 * We come here with mmap_lock write lock held just for
>  -	 * ksm_madvise(), otherwise we only need read mmap_lock.
>  -	 * Hence downgrade to read lock once ksm_madvise() is done.
>  -	 */
>  -	ret =3D ksm_madvise(vma, vma->vm_start, vma->vm_end,
>  -			  MADV_UNMERGEABLE, &vma->vm_flags);
>  -	mmap_write_downgrade(kvm->mm);
>  -	*downgrade =3D true;
>  -	if (ret)
>  -		return ret;
>  -
>   	ret =3D migrate_vma_setup(&mig);
>   	if (ret)
>   		return ret;

This is now a conflict between the kvm-ppc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/S.pOUDO0VZ7wA8OPX4Fwvlm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8renwACgkQAVBC80lX
0Gxe9gf/UqVNAlD8YKt7dyGF6wstgb+Obm90uc+ixrxrR6Vzd0V+jd6+UvXs02bn
xcYU+GGhK09dN4X03SpM+mnV1G/ocjuuV6GDll0+Z+1h2OW9bLDkLVVrxoyYaDnY
8IjPXXH5TbRfM/JjIKusnoyGvsrFkz6f6+QZNepL4dvTMiKfoxVrwJUfK5rq49k7
nfA2JnQychvkZWrhEDWjaGXPTnWUePdAumC1nISjQqd8/HhLNP7JRW9Zttph+B+t
MwL8zTz4zjKjsgpKKnwwiaPRe94k/nznzGuseSFWbYg36Kees3WQZZ8hVwNA1XJI
EczjCYVuCRXG895xwv1SlfVkyWSwqA==
=NKeY
-----END PGP SIGNATURE-----

--Sig_/S.pOUDO0VZ7wA8OPX4Fwvlm--
